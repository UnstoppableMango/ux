package cli

import (
	"slices"

	"github.com/unstoppablemango/ux/pkg/cli/sink"
	"github.com/unstoppablemango/ux/pkg/cli/source"
)

func Parse(opts Options, args []string) (i Input, err error) {
	if len(args) == 0 {
		return
	}
	if slices.Contains(args, "-") {
		i.addSource("-", source.Stdin)
	}
	for _, o := range opts.Outputs {
		i.addSink(o, sink.File(o))
	}

	return i, nil
}
