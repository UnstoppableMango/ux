package plugin

import "github.com/spf13/cobra"

var PluginCmd = New()

func New() *cobra.Command {
	return &cobra.Command{
		Use:   "plugin",
		Short: "Plugin related commands",
	}
}
