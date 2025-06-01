package cmd

import (
	"github.com/spf13/cobra"
	ux "github.com/unstoppablemango/ux/pkg"
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
		Run: func(cmd *cobra.Command, args []string) {
			input, err := cli.Parse(options.Options, args)
			if err != nil {
				cli.Fail(err)
			}
			if err = ux.Generate(cmd.Context(), input); err != nil {
				cli.Fail(err)
			}
		},
	}

	cli.Flags(cmd, &options.Options)

	return cmd
}
