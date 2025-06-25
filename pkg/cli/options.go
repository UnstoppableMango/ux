package cli

import (
	"github.com/spf13/cobra"
)

type Options struct {
	Inputs  []string
	Outputs []string
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
