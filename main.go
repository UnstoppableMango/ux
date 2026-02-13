package main

import (
	"github.com/unmango/go/cli"
	"github.com/unstoppablemango/ux/cmd"
)

var Version = "0.0.1-alpha"

func main() {
	if err := cmd.Execute(); err != nil {
		cli.Fail(err)
	}
}
