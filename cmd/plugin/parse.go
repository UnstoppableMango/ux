package plugin

import (
	"fmt"

	"github.com/spf13/cobra"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/cli"
)

func NewParse() *cobra.Command {
	return &cobra.Command{
		Use:   "parse [NAME]",
		Short: "plugin.Parse(NAME, parser.Default)",
		Args:  cobra.ExactArgs(1),
		Run: func(cmd *cobra.Command, args []string) {
			if p, err := plugin.Parse(args[0], cli.Parser); err != nil {
				cli.Fail(err)
			} else {
				fmt.Println(p)
			}
		},
	}
}
