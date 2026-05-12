package cmd

import (
	"os"

	"charm.land/log/v2"
	"github.com/spf13/cobra"
	"github.com/unmango/go/cli"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/config"
)

var rootCmd = &cobra.Command{
	Use:   "ux",
	Short: "Codegen toolkit",
	PersistentPreRun: func(cmd *cobra.Command, args []string) {
		log.SetOutput(cmd.OutOrStdout())
		if _, ok := os.LookupEnv("DEBUG"); ok {
			log.SetLevel(log.DebugLevel)
		}
	},
	Run: func(cmd *cobra.Command, args []string) {
		cfg, err := config.OpenFirstRoot(".")
		if err != nil {
			cli.Fail(err)
		}

		msgs, err := ux.Invoke(cmd.Context(), cfg, nil)
		if err != nil {
			cli.Fail(err)
		}

		for name, msg := range msgs {
			log.Info("Message", "name", name, "lines", msg.GetLines())
		}
	},
}

func Execute() error {
	return rootCmd.Execute()
}
