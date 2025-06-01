package cmd

import (
	"fmt"
	"os"
	"runtime"
	"runtime/debug"

	"github.com/mattn/go-isatty"
	"github.com/spf13/cobra"
)

var (
	BuildDate string
	GitCommit string
	GoArch    string
	GoOs      string
	GoVersion = runtime.Version()
	Version   = "v0.0.1-development"
)

var versionCmd = NewVersion()

func init() {
	if info, ok := debug.ReadBuildInfo(); ok {
		var modified bool
		for _, setting := range info.Settings {
			switch setting.Key {
			case "vcs.revision":
				GitCommit = setting.Value
			case "vcs.time":
				BuildDate = setting.Value
			case "vcs.modified":
				modified = true
			}
		}
		if modified {
			GitCommit += "+DIRTY"
		}
	}

	rootCmd.AddCommand(versionCmd)
}

func NewVersion() *cobra.Command {
	return &cobra.Command{
		Use:   "version",
		Short: "Print the version number",
		Run: func(cmd *cobra.Command, args []string) {
			if isatty.IsTerminal(os.Stdout.Fd()) {
				_, _ = fmt.Println(Version, GoVersion, GitCommit, BuildDate)
			} else {
				_, _ = fmt.Print(Version)
			}
		},
	}
}
