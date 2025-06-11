package main

import (
	"context"
	"os"

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

	log.Info("Writing to FS server")
	fs := protofsv1alpha1.NewFs(conn)
	if err := afero.WriteFile(fs, "dummy.txt", []byte("test"), os.ModePerm); err != nil {
		return nil, err
	}

	return &uxv1alpha1.GenerateResponse{Outputs: req.Inputs}, nil
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
