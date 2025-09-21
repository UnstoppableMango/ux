package plugin

import (
	"fmt"

	"github.com/spf13/cobra"
	"github.com/unstoppablemango/ux/pkg/cli"
	"github.com/unstoppablemango/ux/pkg/work"
)

func NewSearch() *cobra.Command {
	return &cobra.Command{
		Use:     "search [PATTERN]",
		Short:   "Search for plugins fuzzy matching PATTERN",
		Aliases: []string{"find"},
		Run: func(cmd *cobra.Command, args []string) {
			work, err := work.Cwd()
			if err != nil {
				cli.Fail(err)
			}

			for p := range work.Plugins() {
				s := fmt.Sprint(p)
			}
		},
	}
}
