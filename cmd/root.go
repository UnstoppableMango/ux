package cmd

import (
	"fmt"

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

		if resp.HasOutput() {
			fmt.Fprintln(cmd.OutOrStdout(), resp.GetOutput())
		} else {
			fmt.Fprintln(cmd.OutOrStdout(), "No output")
		}
	},
}

func Execute() error {
	return rootCmd.Execute()
}
