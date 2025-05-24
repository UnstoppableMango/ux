package cmd

import "github.com/spf13/cobra"

var pluginCmd = NewPlugin()

func init() {
	rootCmd.AddCommand(pluginCmd)
}

func NewPlugin() *cobra.Command {
	return &cobra.Command{
		Use:   "plugin",
		Short: "Plugin related commands",
	}
}
