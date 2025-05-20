package main

import (
	"github.com/unmango/go/cli"
	"github.com/unstoppablemango/ux/cmd"
)

func main() {
	root := cmd.NewUx()
	root.AddCommand(
		cmd.NewCli(),
		cmd.NewGenerate(),
	)

	if err := root.Execute(); err != nil {
		cli.Fail(err)
	}
}
