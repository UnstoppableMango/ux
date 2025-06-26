package cli

import (
	"context"
	"fmt"
	"io"
	"maps"
	"net"
	"os"
	"slices"

	"github.com/charmbracelet/log"
	"github.com/google/uuid"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/fs"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/server"
)

func (o Options) Generate(ctx context.Context, name string) error {
	plugin, err := plugin.Parse(name)
	if err != nil {
		return err
	}

	inputs := map[string]io.Reader{}
	for _, name := range o.Inputs {
		if r, err := os.Open(name); err != nil {
			return fmt.Errorf("opening input file: %w", err)
		} else {
			inputs[name] = r
		}
	}

	srv := server.New(server.WithInputs(inputs))
	grpc := srv.Server()
	defer grpc.GracefulStop()

	sock, err := server.TempSocket("", "")
	if err != nil {
		return err
	}

	lis, err := net.Listen("unix", sock)
	if err != nil {
		return err
	}

	go func() {
		log.Debug("Serving FS")
		_ = grpc.Serve(lis)
	}()

	log.Debug("Sending generate request")
	id := uuid.NewString()
	res, err := plugin.Generate(ctx, &uxv1alpha1.GenerateRequest{
		Id:      id,
		Inputs:  slices.Collect(maps.Keys(inputs)),
		Address: fmt.Sprintf("unix://%s", sock),
	})
	if err != nil {
		return err
	}

	fs := fs.FromContext(ctx)
	log.Debug("Got outputs", "files", res.Outputs)
	for _, name := range res.Outputs {
		r, err := srv.Output(name)
		if err != nil {
			log.Debugf("No output found at: %s", name)
			continue
		}

		f, err := fs.Create(name)
		if err != nil {
			return fmt.Errorf("creating output: %w", err)
		}

		if _, err = io.Copy(f, r); err != nil {
			return fmt.Errorf("copying output: %w", err)
		}
	}

	return nil
}
