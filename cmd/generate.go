package cmd

import (
	"github.com/spf13/cobra"
	"github.com/unstoppablemango/ux/pkg/cli"
)

type GenerateOptions struct {
	cli.Options
}

var generateCmd = NewGenerate(GenerateOptions{})

func init() {
	rootCmd.AddCommand(generateCmd)
}

func NewGenerate(options GenerateOptions) *cobra.Command {
	cmd := &cobra.Command{
		Use:     "generate",
		Short:   "Code generation commands",
		Aliases: []string{"gen"},
		Args:    cobra.ExactArgs(1),
		Run: func(cmd *cobra.Command, args []string) {
			if err := options.Generate(cmd.Context(), args[0]); err != nil {
				cli.Fail(err)
			}
		},
	}

	cli.Flags(cmd, &options.Options)

	return cmd
}
