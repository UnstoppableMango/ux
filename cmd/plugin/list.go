package plugin

import (
	"fmt"

	"github.com/spf13/cobra"
	"github.com/unstoppablemango/ux/pkg/plugin/registry"
)

func NewList() *cobra.Command {
	return &cobra.Command{
		Use:     "list",
		Short:   "List all reachable plugins",
		Aliases: []string{"ls", "l"},
		Run: func(cmd *cobra.Command, args []string) {
			for p := range registry.Default.List() {
				fmt.Println(p)
			}
		},
	}
}
