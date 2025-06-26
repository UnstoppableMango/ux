package cli

import (
	"context"

	"github.com/spf13/afero"
	"github.com/unstoppablemango/ux/pkg/plugin"
)

// TODO: Probably refactor this

func Generate(ctx context.Context, args []string, options cliOptions) error {
	output := afero.NewOsFs()
	opts := options.(Options)

	return plugin.Generate(ctx, args[0], opts.Inputs, output)
}
