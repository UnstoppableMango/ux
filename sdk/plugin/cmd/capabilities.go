package cmd

import (
	"github.com/spf13/cobra"
	"github.com/unmango/go/cli"
	"github.com/unstoppablemango/ux/sdk/plugin"
)

func NewCapabilities(c plugin.Cli) *cobra.Command {
	return &cobra.Command{
		Use:    "capabilities",
		Hidden: true,
		Run: func(cmd *cobra.Command, args []string) {
			if err := c.Capabilities(cmd.Context()); err != nil {
				cli.Fail(err)
			}
		},
	}
}
