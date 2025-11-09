package cli

import (
	"github.com/spf13/cobra"
	"github.com/unstoppablemango/ux/pkg/plugin/cli"
)

func NewInvoke() *cobra.Command {
	return &cobra.Command{
		Use:   "invoke [PLUGIN] [INPUT] [OUTPUT]",
		Short: "Invoke a CLI plugin",
		Args:  cobra.ExactArgs(3),
		Run: func(cmd *cobra.Command, args []string) {
			plugin := args[0]
			input := args[1]
			output := args[2]

			if err := cli.Invoke(cmd.Context(), plugin, input, output); err != nil {
				cli.Fail(err)
			}
		},
	}
}
