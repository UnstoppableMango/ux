package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
	"github.com/unstoppablemango/ux/pkg/cli"
)

func NewCli() *cobra.Command {
	opts := cli.Options{}

	cmd := &cobra.Command{
		Use:    "cli",
		Hidden: true,
		Short:  "CLI e2e testing",
		Run: func(cmd *cobra.Command, args []string) {
			fmt.Println("Got opts: ", opts)
			fmt.Println("Got args: ", args)

			if inputs, err := cli.Parse(opts, args); err != nil {
				cli.Fail(err)
			} else {
				fmt.Println("Parsed inputs: ", inputs)
			}
		},
	}

	cli.Flags(cmd, &opts)

	return cmd
}
