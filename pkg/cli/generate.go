package cli

import (
	"context"

	"github.com/spf13/afero"
	"github.com/unstoppablemango/ux/pkg/plugin"
)

func Generate(ctx context.Context, args []string, options OptionsParser) (afero.Fs, error) {
	if in, err := Parse(args, options); err != nil {
		return nil, err
	} else {
		return plugin.Generate(ctx, args[0], in)
	}
}
