package cli

import "github.com/spf13/cobra"

var Cmd = New()

func init() {
	Cmd.AddCommand(
		NewInvoke(),
	)
}

func New() *cobra.Command {
	return &cobra.Command{
		Use:   "cli",
		Short: "Commands specific to CLI plugins",
	}
}
