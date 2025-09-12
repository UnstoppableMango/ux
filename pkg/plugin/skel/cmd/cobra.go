package cmd

import (
	"github.com/spf13/cobra"
	"github.com/unmango/go/cli"
	"github.com/unstoppablemango/ux/pkg/plugin/skel"
)

func CobraRun(skel *skel.Cli) func(*cobra.Command, []string) {
	return func(cmd *cobra.Command, _ []string) {
		if err := skel.ExecuteContext(cmd.Context()); err != nil {
			cli.Fail(err)
		}
	}
}

func NewCobra(name string, skel *skel.Cli) *cobra.Command {
	return &cobra.Command{
		Use: name,
		Run: CobraRun(skel),
	}
}
