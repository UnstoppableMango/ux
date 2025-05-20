package cmd

import "github.com/spf13/cobra"

func NewPlugin() *cobra.Command {
	return &cobra.Command{
		Use: "plugin",
	}
}
