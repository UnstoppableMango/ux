package cmd

import (
	"charm.land/log/v2"
	"github.com/spf13/cobra"
	"github.com/unmango/go/cli"
	ux "github.com/unstoppablemango/ux/pkg"
)

var rootCmd = &cobra.Command{
	Use:   "ux",
	Short: "Codegen toolkit",
	Run: func(cmd *cobra.Command, args []string) {
		s := ux.NewServer()
		req := &ux.InvokeRequest{}
		resp, err := s.Invoke(cmd.Context(), req)
		if err != nil {
			cli.Fail(err)
		}

		log := log.New(cmd.OutOrStdout())
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
