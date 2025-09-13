package plugin

import (
	"github.com/spf13/cobra"
	"github.com/unmango/go/cli"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/parser"
	"github.com/unstoppablemango/ux/pkg/spec"
)

func NewRun() *cobra.Command {
	return &cobra.Command{
		Use:   "run [NAME] [ARGS...]",
		Short: "plugin.Parse(NAME).Execute(ARGS...)",
		Args:  cobra.MinimumNArgs(1),
		Run: func(cmd *cobra.Command, args []string) {
			p, err := plugin.Parse(args[0], parser.Default)
			if err != nil {
				cli.Fail(err)
			}

			// Temporary requirement
			source := spec.Token(args[1])
			target := spec.Token(args[2])

			g, err := p.Generator(source, target)
			if err != nil {
				cli.Fail(err)
			}

			if err := g.Generate(cmd.Context(), nil); err != nil {
				cli.Fail(err)
			}
		},
	}
}
