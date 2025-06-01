package cli

import (
	"slices"

	"github.com/unmango/go/iter"
	"github.com/unstoppablemango/ux/pkg/cli/source"
)

func Parse(opts Options, args []string) (i Input, err error) {
	if i.sources, err = opts.Sources(); err != nil {
		return i, err
	}
	if slices.Contains(args, "-") {
		i.sources = iter.Append2(i.sources, "-", source.Stdin)
	}
	if i.sinks, err = opts.Sinks(); err != nil {
		return i, err
	}

	return i, nil
}
