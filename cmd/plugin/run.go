package plugin

import (
	"github.com/spf13/cobra"
	"github.com/unmango/go/cli"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/parser"
)

func NewRun() *cobra.Command {
	return &cobra.Command{
		Use:   "run [NAME] [ARGS...]",
		Short: "plugin.Parse(NAME, parser.Default).Execute(ARGS...)",
		Args:  cobra.MinimumNArgs(1),
		Run: func(cmd *cobra.Command, args []string) {
			p, err := plugin.Parse(args[0], parser.Default)
			if err != nil {
				cli.Fail(err)
			}

			if err := p.Execute(args[1:]); err != nil {
				cli.Fail(err)
			}
		},
	}
}
