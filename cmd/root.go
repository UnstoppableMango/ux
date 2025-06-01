package cmd

import (
	"github.com/charmbracelet/log"
	"github.com/unstoppablemango/ux/cmd/plugin"
)

var rootCmd = NewUx()

func init() {
	rootCmd.AddCommand(
		plugin.PluginCmd,
	)
}

func Execute() error {
	log.SetReportTimestamp(false)
	return rootCmd.Execute()
}
