package plugin

import "github.com/spf13/cobra"

func NewCapabilities() *cobra.Command {
	return &cobra.Command{
		Use:     "capabilities",
		Short:   "Print plugin capabilities",
		Aliases: []string{"caps"},
		Run: func(cmd *cobra.Command, args []string) {
			
		},
	}
}
