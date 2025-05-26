package plugin

import "github.com/spf13/cobra"

var PluginCmd = New()

func init() {
	PluginCmd.AddCommand(
		NewConformance(),
		NewList(),
	)
}

func New() *cobra.Command {
	return &cobra.Command{
		Use:   "plugin",
		Short: "Plugin related commands",
	}
}
