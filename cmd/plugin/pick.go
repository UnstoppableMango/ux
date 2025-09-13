package plugin

import (
	"fmt"

	"github.com/spf13/cobra"
	"github.com/unmango/go/cli"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/spec"
	"github.com/unstoppablemango/ux/pkg/work"
)

func NewPick() *cobra.Command {
	return &cobra.Command{
		Use:   "pick [SPEC] [SPEC]",
		Short: "Print the first plugin satisfying all arguments",
		Args:  cobra.ExactArgs(2),
		Run: func(cmd *cobra.Command, args []string) {
			a := spec.Token(args[0])
			b := spec.Token(args[1])

			ws, err := work.Cwd()
			if err != nil {
				cli.Fail(err)
			}

			if g, err := ux.Pick(ws.Plugins(), a, b); err != nil {
				cli.Fail(err)
			} else {
				fmt.Println(g)
			}
		},
	}
}
