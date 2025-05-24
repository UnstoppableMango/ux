package cmd

import (
	"github.com/spf13/cobra"
	"github.com/unstoppablemango/ux/pkg/cli"
	"github.com/unstoppablemango/ux/pkg/ux"
)

func NewGenerate() *cobra.Command {
	opts := cli.Options{}
	cmd := &cobra.Command{
		Use:     "generate",
		Short:   "Code generation commands",
		Aliases: []string{"gen"},
		Run: func(cmd *cobra.Command, args []string) {
			input, err := cli.Parse(opts, args)
			if err != nil {
				cli.Fail(err)
			}

			ctx := cmd.Context()
			if err := ux.Generate(ctx, input); err != nil {
				cli.Fail(err)
			}
		},
	}

	cli.Flags(cmd, &opts)
	return cmd
}
