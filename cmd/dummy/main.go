package main

import (
	"context"
	"path/filepath"
	"strings"

	"github.com/charmbracelet/log"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/sdk/client"
	"github.com/unstoppablemango/ux/sdk/plugin"
	"github.com/unstoppablemango/ux/sdk/plugin/cli"
	"github.com/unstoppablemango/ux/sdk/plugin/cmd"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
)

type generator struct{}

// Generate implements ux.Generator.
func (generator) Generate(ctx context.Context, req *uxv1alpha1.GenerateRequest) (*uxv1alpha1.GenerateResponse, error) {
	log.Info("Creating new fs client", "address", req.Address)
	client, err := client.FromRequest(req,
		grpc.WithTransportCredentials(insecure.NewCredentials()),
	)
	if err != nil {
		return nil, err
	}

	outputs := []string{}
	for _, input := range req.Inputs {
		log.Infof("Attempting to open input: %s", input)
		res, err := client.Open(ctx, &uxv1alpha1.OpenRequest{
			Name: &input,
		})
		if err != nil {
			log.Infof("Failed to open input: %s", input)
			return nil, err
		}

		ext := filepath.Ext(input)
		output := strings.ReplaceAll(input, ext, ".dummy"+ext)
		_, err = client.Write(ctx, &uxv1alpha1.WriteRequest{
			Name: &output,
			Data: res.Data,
		})

		outputs = append(outputs, input)
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
