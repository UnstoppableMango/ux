package cli

import (
	"slices"

	"github.com/unstoppablemango/ux/pkg/cli/sink"
	"github.com/unstoppablemango/ux/pkg/cli/source"
)

func Parse(opts Options, args []string) (i Input, err error) {
	if slices.Contains(args, "-") {
		i.addSource("-", source.Stdin)
	}
	for _, x := range opts.Inputs {
		i.addSource(x, source.File(x))
	}
	for _, x := range opts.Outputs {
		i.addSink(x, sink.File(x))
	}

	return i, nil
}
