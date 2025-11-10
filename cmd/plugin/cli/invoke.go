package cli

import (
	"github.com/spf13/cobra"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/cli"
)

func NewInvoke() *cobra.Command {
	return &cobra.Command{
		Use:   "invoke [PLUGIN] [ARGS...]",
		Short: "Invoke a CLI plugin",
		Args:  cobra.MinimumNArgs(1),
		Run: func(cmd *cobra.Command, args []string) {
			ctx := cmd.Context()
			plugin := plugin.String(args[0])

			if err := cli.Invoke(ctx, plugin, args[1:]); err != nil {
				cli.Fail(err)
			}
		},
	}
}
