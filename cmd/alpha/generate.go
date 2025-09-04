package alpha

import (
	"github.com/spf13/cobra"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/cli"
	"github.com/unstoppablemango/ux/pkg/input"
	"github.com/unstoppablemango/ux/pkg/spec"
	"github.com/unstoppablemango/ux/pkg/work"
)

func NewGenerate() *cobra.Command {
	cmd := &cobra.Command{
		Use:     "generate [TARGET] [INPUT...]",
		Aliases: []string{"gen"},
		Args:    cobra.MinimumNArgs(2),
		Run: func(cmd *cobra.Command, args []string) {
			target := spec.Token(args[0])
			i, err := input.Parse(args[1])
			if err != nil {
				cli.Fail(err)
			}

			w, err := work.Cwd()
			if err != nil {
				cli.Fail(err)
			}

			if err := ux.Generate(cmd.Context(), w, target, i); err != nil {
				cli.Fail(err)
			}
		},
	}

	return cmd
}
