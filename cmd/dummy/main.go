package main

import (
	"context"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/sdk/plugin"
	"github.com/unstoppablemango/ux/sdk/plugin/cli"
	"github.com/unstoppablemango/ux/sdk/plugin/cmd"
)

type generator struct{}

// Generate implements ux.Generator.
func (generator) Generate(context.Context, *uxv1alpha1.GenerateRequest) (*uxv1alpha1.GenerateResponse, error) {
	return &uxv1alpha1.GenerateResponse{}, nil
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
