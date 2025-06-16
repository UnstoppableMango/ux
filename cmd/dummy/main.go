package main

import (
	"context"
	"io"
	"os"
	"path/filepath"

	filev1alpha1 "buf.build/gen/go/unmango/protofs/protocolbuffers/go/dev/unmango/file/v1alpha1"
	"github.com/charmbracelet/log"
	"github.com/spf13/afero"
	protofsv1alpha1 "github.com/unmango/aferox/protofs/grpc/v1alpha1"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/sdk/plugin"
	"github.com/unstoppablemango/ux/sdk/plugin/cli"
	"github.com/unstoppablemango/ux/sdk/plugin/cmd"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
)

type generator struct{}

// Generate implements ux.Generator.
func (generator) Generate(_ context.Context, req *uxv1alpha1.GenerateRequest) (*uxv1alpha1.GenerateResponse, error) {
	log.Info("Creating new fs client", "address", req.FsAddress)
	conn, err := grpc.NewClient(req.FsAddress,
		grpc.WithTransportCredentials(insecure.NewCredentials()),
	)
	if err != nil {
		return nil, err
	}

	fs := protofsv1alpha1.NewFs(conn)
	outputs := []*filev1alpha1.File{}
	for _, input := range req.Inputs {
		log.Infof("Attempting to open input: %s", input.Name)
		file, err := fs.Open(input.Name)
		if err != nil {
			log.Infof("Failed to open input: %s", input.Name)
			return nil, err
		}

		data, err := io.ReadAll(file)
		if err != nil {
			return nil, err
		}

		path := filepath.Join("output", file.Name())
		if err = afero.WriteFile(fs, path, data, os.ModePerm); err != nil {
			return nil, err
		}

		outputs = append(outputs, &filev1alpha1.File{
			Name: path,
		})
	}

	return &uxv1alpha1.GenerateResponse{Outputs: outputs}, nil
}

var Plugin = plugin.New(
	plugin.WithCapabilities(&uxv1alpha1.Capability{
		From:  "dummyA",
		To:    "dummyB",
		Lossy: true,
	}),
	plugin.WithGenerator(generator{}),
)

func main() {
	if err := cmd.Execute("dummy", cli.New(Plugin)); err != nil {
		cli.Fail(err)
	}
}
