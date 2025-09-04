package alpha

import "github.com/spf13/cobra"

var Cmd = New()

func init() {
	Cmd.AddCommand(
		NewGenerate(),
		NewList(),
	)
}

func New() *cobra.Command {
	return &cobra.Command{
		Use:   "alpha",
		Short: "Experimental commands",
	}
}
