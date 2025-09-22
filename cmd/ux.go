package cmd

import (
	"github.com/charmbracelet/log"
	"github.com/spf13/cobra"
	"github.com/unstoppablemango/ux/pkg/cmd"
)

type UxOptions struct {
	cmd.GlobalOptions
}

func NewUx() *cobra.Command {
	opts := UxOptions{}
	cmd := &cobra.Command{
		Use:   "ux",
		Short: "The universal codegen CLI",
		PersistentPreRun: func(cmd *cobra.Command, args []string) {
			if opts.Verbose {
				log.SetLevel(log.DebugLevel)
			}
		},
	}

	opts.ApplyFlags(cmd.PersistentFlags())

	return cmd
}
