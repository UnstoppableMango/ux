package plugin

import (
	"github.com/spf13/cobra"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/cli"
)

func NewRun() *cobra.Command {
	return &cobra.Command{
		Use:   "run [NAME] [ARGS...]",
		Short: "plugin.Parse(NAME, cli.Parser).Execute(ARGS...)",
		Args:  cobra.MinimumNArgs(1),
		Run: func(cmd *cobra.Command, args []string) {
			p, err := plugin.Parse(args[0], cli.Parser)
			if err != nil {
				cli.Fail(err)
			}

			if err := p.Execute(args[1:]); err != nil {
				cli.Fail(err)
			}
		},
	}
}
