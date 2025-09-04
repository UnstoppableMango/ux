package cmd

import (
	"github.com/charmbracelet/log"
	"github.com/unstoppablemango/ux/cmd/alpha"
	"github.com/unstoppablemango/ux/cmd/plugin"
)

var rootCmd = NewUx()

func init() {
	rootCmd.AddCommand(
		plugin.Cmd,
		alpha.Cmd,
	)
}

func Execute() error {
	log.SetReportTimestamp(false)
	return rootCmd.Execute()
}
