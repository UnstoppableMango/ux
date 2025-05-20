package cmd

import (
	"github.com/spf13/cobra"
)

func NewUx() *cobra.Command {
	return &cobra.Command{
		Use:   "ux",
		Short: "The universal codegen CLI",
	}
}
