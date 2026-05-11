package cmd

import (
	"os"

	"charm.land/log/v2"
	"github.com/spf13/cobra"
	"github.com/unmango/go/cli"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"
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
		log.Debug("Opening root")
		root, err := os.OpenRoot(".")
		if err != nil {
			cli.Fail(err)
		}
		log.Debug("Searching for first config")
		cfg, err := config.OpenFirst(root)
		if err != nil {
			log.Error("No config :(")
			cli.Fail(err)
		}

		log.Debug("Invoking with config", "cfg", cfg)
		s := ux.NewServer()
		req := &uxv1alpha1.InvokeRequest_builder{Config: cfg}
		resp, err := s.Invoke(cmd.Context(), req.Build())
		if err != nil {
			cli.Fail(err)
		}

		if resp.HasOutput() {
			log.Info(resp.GetOutput())
		} else {
			log.Info("No output")
		}
	},
}

func Execute() error {
	return rootCmd.Execute()
}
