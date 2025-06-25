package plugin

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
	"github.com/spf13/afero"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/server"
)

func Generate(ctx context.Context, name string, input []string) (afero.Fs, error) {
	plugin, err := Parse(name)
	if err != nil {
		return nil, err
	}

	inputs := map[string]io.Reader{}
	for _, name := range input {
		if r, err := os.Open(name); err != nil {
			return nil, fmt.Errorf("opening input file: %w", err)
		} else {
			inputs[name] = r
		}
	}

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
