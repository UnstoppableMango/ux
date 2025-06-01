package cli

import (
	"iter"
	"maps"

	"github.com/spf13/cobra"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/cli/sink"
	"github.com/unstoppablemango/ux/pkg/cli/source"
)

type Options struct {
	Inputs  []string
	Outputs []string
}

func (opts Options) Sinks() (iter.Seq2[string, ux.Sink], error) {
	sinks := map[string]ux.Sink{}
	for _, o := range opts.Outputs {
		if s, err := sink.Parse(o); err != nil {
			return nil, err
		} else {
			sinks[o] = s
		}
	}

	return maps.All(sinks), nil
}

func (opts Options) Sources() (iter.Seq2[string, ux.Source], error) {
	sources := map[string]ux.Source{}
	for _, i := range opts.Inputs {
		if s, err := source.Parse(i); err != nil {
			return nil, err
		} else {
			sources[i] = s
		}
	}

	return maps.All(sources), nil
}

func Flags(cmd *cobra.Command, opts *Options) {
	InputFlag(cmd, opts, nil)
	OutputFlag(cmd, opts, nil)
}

func InputFlag(cmd *cobra.Command, opts *Options, value []string) {
	cmd.Flags().StringSliceVarP(&opts.Inputs, "input", "i", value, "")
}

func OutputFlag(cmd *cobra.Command, opts *Options, value []string) {
	cmd.Flags().StringSliceVarP(&opts.Outputs, "output", "o", value, "")
}
