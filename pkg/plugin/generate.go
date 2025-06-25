package plugin

import (
	"context"
	"fmt"
	"io"
	"maps"
	"net"
	"slices"

	"github.com/charmbracelet/log"
	"github.com/google/uuid"
	"github.com/spf13/afero"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/server"
)

func Generate(ctx context.Context, name string, in ux.Input) (afero.Fs, error) {
	plugin, err := Parse(name)
	if err != nil {
		return nil, err
	}

	inputs := map[string]io.Reader{}
	for name, src := range in.Sources() {
		if r, err := src.Open(ctx); err != nil {
			return nil, err
		} else {
			inputs[name] = r
		}
	}

	log.Debug("Starting FS server")
	output := afero.NewMemMapFs()
	srv := server.New(server.WithInputs(inputs))
	grpc := srv.Server()
	defer grpc.GracefulStop()

	sock, err := server.TempSocket("", "")
	if err != nil {
		return nil, err
	}

	lis, err := net.Listen("unix", sock)
	if err != nil {
		return nil, err
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
		Address: fmt.Sprintf("unix://%s", lis.Addr()),
	})
	if err != nil {
		return nil, err
	}

	log.Debug("Got outputs", "files", res.Outputs)
	for _, name := range res.Outputs {
		if stat, err := output.Stat(name); err != nil {
			log.Debugf("No output found at: %s", name)
		} else {
			log.Debugf("Found output: %s", stat.Name())
		}
	}

	return output, err
}
