package plugin

import (
	"github.com/spf13/cobra"
	"github.com/unstoppablemango/ux/cmd/plugin/cli"
)

var Cmd = New()

func init() {
	Cmd.AddCommand(
		cli.Cmd,
		NewConformance(),
		NewList(),
		NewParse(),
		NewRun(),
		NewSearch(),
	)
}

func New() *cobra.Command {
	return &cobra.Command{
		Use:   "plugin",
		Short: "Plugin related commands",
	}
}
