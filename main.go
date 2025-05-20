package main

import (
	"github.com/unmango/go/cli"
	"github.com/unstoppablemango/ux/cmd"
)

func main() {
	root := cmd.NewUx()

	plugin := cmd.NewPlugin()
	plugin.AddCommand(cmd.NewConformance())

	root.AddCommand(
		cmd.NewCli(),
		cmd.NewGenerate(),
		plugin,
	)

	if err := root.Execute(); err != nil {
		cli.Fail(err)
	}
}
