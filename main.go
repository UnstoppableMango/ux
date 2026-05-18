package main

import (
	"os"

	"github.com/mattn/go-isatty"
	"github.com/unmango/go/cli"
	"github.com/unstoppablemango/ux/cmd"
	ux "github.com/unstoppablemango/ux/pkg"
)

func main() {
	var err error
	if isatty.IsTerminal(os.Stdin.Fd()) {
		err = cmd.Execute()
	} else {
		err = ux.InvokeStdin(os.Stdin)
	}
	if err != nil {
		cli.Fail(err)
	}
}
