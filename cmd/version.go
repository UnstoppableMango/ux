package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

var Version string = "v0.0.1-development"

func init() {
	rootCmd.AddCommand(NewVersion())
}

func NewVersion() *cobra.Command {
	return &cobra.Command{
		Use:   "version",
		Short: "Print the version number",
		Run: func(cmd *cobra.Command, args []string) {
			fmt.Println(Version)
		},
	}
}
