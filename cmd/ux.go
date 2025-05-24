package cmd

import (
	"github.com/spf13/cobra"
	"github.com/unstoppablemango/ux/pkg/config"
)

type UxOptions struct {
	config.GlobalOptions
}

func NewUx() *cobra.Command {
	opts := UxOptions{}
	cmd := &cobra.Command{
		Use:   "ux",
		Short: "The universal codegen CLI",
	}

	opts.ConfigVar(cmd.PersistentFlags())

	return cmd
}
