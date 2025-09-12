package plugin

import (
	"fmt"

	"github.com/spf13/cobra"
	"github.com/unmango/go/cli"
	"github.com/unstoppablemango/ux/pkg/plugin/legacy/registry"
)

func NewList() *cobra.Command {
	return &cobra.Command{
		Use:     "list",
		Short:   "List all reachable plugins",
		Aliases: []string{"ls", "l"},
		Run: func(cmd *cobra.Command, args []string) {
			plugins, err := registry.List(cmd.Context())
			if err != nil {
				cli.Fail(err)
			}

			for k := range plugins {
				fmt.Println(k)
			}
		},
	}
}
