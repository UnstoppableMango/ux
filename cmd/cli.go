package cmd

import "github.com/spf13/cobra"

func NewCli() *cobra.Command {
	return &cobra.Command{
		Use:    "cli",
		Hidden: true,
		Short:  "CLI e2e testing",
	}
}
