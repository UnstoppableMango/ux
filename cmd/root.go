package cmd

import (
	"os"

	"github.com/spf13/afero"
	"github.com/spf13/cobra"
	"github.com/unmango/go/cli"
	"github.com/unstoppablemango/ux/pkg"
)

var rootCmd = &cobra.Command{
	Use:   "ux",
	Short: "Codegen glue tooling",
	Run: func(cmd *cobra.Command, args []string) {
		fs := afero.NewOsFs()
		wd, err := os.Getwd()
		if err != nil {
			cli.Fail(err)
		}

		if err := pkg.Execute(fs, wd); err != nil {
			cli.Fail(err)
		}
	},
}

func Execute() error {
	return rootCmd.Execute()
}

func init() {
	rootCmd.AddCommand(versionCmd)
}
