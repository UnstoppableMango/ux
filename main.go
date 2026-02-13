package main

import (
	"github.com/unmango/go/cli"
	"github.com/unstoppablemango/ux/cmd"
)

func main() {
	if err := cmd.Execute(); err != nil {
		cli.Fail(err)
	}
}
