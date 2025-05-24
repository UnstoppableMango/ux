package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

var generateCmd = NewGenerate()

func init() {
	rootCmd.AddCommand(generateCmd)
}

func NewGenerate() *cobra.Command {
	return &cobra.Command{
		Use:     "generate",
		Short:   "Code generation commands",
		Aliases: []string{"gen"},
		Run: func(cmd *cobra.Command, args []string) {
			fmt.Println("Hello World!")
		},
	}
}
