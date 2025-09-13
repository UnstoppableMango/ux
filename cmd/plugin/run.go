package plugin

import (
	"github.com/spf13/cobra"
)

func NewRun() *cobra.Command {
	return &cobra.Command{
		Use:   "run [NAME] [ARGS...]",
		Short: "plugin.Parse(NAME).Execute(ARGS...)",
		Run: func(cmd *cobra.Command, args []string) {

		},
	}
}
