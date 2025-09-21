package plugin

import "github.com/spf13/cobra"

var Cmd = New()

func init() {
	Cmd.AddCommand(
		NewConformance(),
		NewList(),
		NewParse(),
		NewRun(),
	)
}

func New() *cobra.Command {
	return &cobra.Command{
		Use:   "plugin",
		Short: "Plugin related commands",
	}
}
