package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

func NewGenerate() *cobra.Command {
	return &cobra.Command{
		Use:     "generate",
		Aliases: []string{"gen"},
		Run: func(cmd *cobra.Command, args []string) {
			fmt.Println("Hello World!")
		},
	}
}
