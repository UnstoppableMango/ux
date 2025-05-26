package cmd

import "github.com/unstoppablemango/ux/cmd/plugin"

var rootCmd = NewUx()

func init() {
	rootCmd.AddCommand(
		plugin.PluginCmd,
		NewCli(),
		NewGenerate(),
	)
}

func Execute() error {
	return rootCmd.Execute()
}
