package alpha

import (
	"fmt"

	"github.com/spf13/cobra"
	"github.com/unstoppablemango/ux/pkg/plugin/registry"
)

func NewList() *cobra.Command {
	cmd := &cobra.Command{
		Use:     "list",
		Aliases: []string{"ls"},
		Run: func(cmd *cobra.Command, args []string) {
			// w, err := work.Cwd()
			// if err != nil {
			// 	cli.Fail(err)
			// }

			for p := range registry.Default.List() {
				fmt.Println(p)
			}
		},
	}

	return cmd
}
