package cli

import (
	"context"

	"github.com/spf13/afero"
	"github.com/unstoppablemango/ux/pkg/plugin"
)

// TODO: Probably refactor this

func Generate(ctx context.Context, args []string, options Options) (afero.Fs, error) {
	return plugin.Generate(ctx, args[0], options.Inputs)
}
