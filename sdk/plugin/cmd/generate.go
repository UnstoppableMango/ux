package cmd

import (
	"os"

	"github.com/mattn/go-isatty"
	"github.com/spf13/cobra"
	"github.com/unmango/go/cli"
	"github.com/unstoppablemango/ux/sdk/plugin"
)

func NewGenerate(c plugin.Cli) *cobra.Command {
	return &cobra.Command{
		Use:    "generate",
		Hidden: true,
		Run: func(cmd *cobra.Command, args []string) {
			if isatty.IsTerminal(os.Stdin.Fd()) {
				// TODO: Generate directly
			} else {
				if err := c.Generate(cmd.Context()); err != nil {
					cli.Fail(err)
				}
			}
		},
	}
}
