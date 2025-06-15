package cli

import (
	"slices"

	"github.com/unmango/go/iter"
	"github.com/unstoppablemango/ux/pkg/cli/source"
)

func Parse(args []string, opts OptionsParser) (input Input, err error) {
	if input.sources, err = opts.Sources(); err != nil {
		return input, err
	}
	if slices.Contains(args, "-") {
		input.sources = iter.Append2(input.sources, "-", source.Stdin)
	}
	if input.sinks, err = opts.Sinks(); err != nil {
		return input, err
	}

	return input, nil
}
