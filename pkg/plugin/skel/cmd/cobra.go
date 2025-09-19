package cmd

import (
	"github.com/spf13/cobra"
	"github.com/unmango/go/cli"
	"github.com/unstoppablemango/ux/pkg/plugin/skel"
)

func CobraRunFunc(funcs skel.UxFuncs) func(*cobra.Command, []string) {
	return func(cmd *cobra.Command, args []string) {
		if err := skel.PluginMainOs(funcs, cmd.InOrStdin(), args); err != nil {
			cli.Fail(err)
		}
	}
}

func NewCobra(name string, funcs skel.UxFuncs) *cobra.Command {
	return &cobra.Command{
		Use: name,
		Run: CobraRunFunc(funcs),
	}
}
