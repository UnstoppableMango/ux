package plugin

import (
	"fmt"

	"github.com/sahilm/fuzzy"
	"github.com/spf13/cobra"
	"github.com/unstoppablemango/ux/pkg/cli"
	"github.com/unstoppablemango/ux/pkg/work"
)

func NewSearch() *cobra.Command {
	return &cobra.Command{
		Use:     "search [PATTERN]",
		Short:   "Search for plugins fuzzy matching PATTERN",
		Aliases: []string{"find"},
		Args:    cobra.ExactArgs(1),
		Run: func(cmd *cobra.Command, args []string) {
			work, err := work.Cwd()
			if err != nil {
				cli.Fail(err)
			}

			var plugins []string
			for p := range work.Plugins() {
				plugins = append(plugins, fmt.Sprint(p))
			}

			for _, m := range fuzzy.Find(args[0], plugins) {
				fmt.Println(m.Str)
			}
		},
	}
}
