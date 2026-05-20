package cmd

import (
	"os"

	"github.com/mattn/go-isatty"
	"github.com/spf13/cobra"
	"github.com/unstoppablemango/ux/internal"
)

var versionCmd = &cobra.Command{
	Use:   "version",
	Short: "Print version information",
	Run: func(cmd *cobra.Command, args []string) {
		if isatty.IsTerminal(os.Stdout.Fd()) {
			cmd.Println(internal.Version)
		} else {
			cmd.Print(internal.Version)
		}
	},
}

func init() {
	rootCmd.AddCommand(versionCmd)
}
