package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

func NewUx() *cobra.Command {
	return &cobra.Command{
		Use: "ux",
		Run: func(cmd *cobra.Command, args []string) {
			fmt.Println("Hello World!")
		},
	}
}
