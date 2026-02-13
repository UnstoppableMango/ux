package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

var rootCmd = &cobra.Command{
	Use:   "ux",
	Short: "Codegen glue tooling",
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("Got here")
	},
}

func Execute() error {
	return rootCmd.Execute()
}

func init() {
	rootCmd.AddCommand(versionCmd)
}
