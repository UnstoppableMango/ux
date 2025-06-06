package cmd

import (
	"fmt"
	"os"

	"github.com/mattn/go-isatty"
	"github.com/spf13/cobra"
	"github.com/unstoppablemango/ux/internal"
)

var versionCmd = NewVersion()

func init() {
	rootCmd.AddCommand(versionCmd)
}

func NewVersion() *cobra.Command {
	return &cobra.Command{
		Use:   "version",
		Short: "Print the version number",
		Run: func(cmd *cobra.Command, args []string) {
			version := internal.RuntimeVersion()
			if isatty.IsTerminal(os.Stdout.Fd()) {
				info := internal.ReadBuildInfo()
				_, _ = fmt.Println(version,
					info.GoVersion,
					info.GitCommit,
					info.BuildDate,
				)
			} else {
				_, _ = fmt.Print(version)
			}
		},
	}
}
