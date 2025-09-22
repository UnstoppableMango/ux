package plugin

import (
	"fmt"

	"github.com/spf13/cobra"
	"github.com/unmango/go/cli"
	"github.com/unstoppablemango/ux/pkg/work"
)

func NewList() *cobra.Command {
	return &cobra.Command{
		Use:     "list",
		Short:   "List all reachable plugins",
		Aliases: []string{"ls", "l"},
		Run: func(cmd *cobra.Command, args []string) {
			work, err := work.Cwd()
			if err != nil {
				cli.Fail(err)
			}

			for p := range work.Plugins() {
				fmt.Println(p)
			}
		},
	}
}
