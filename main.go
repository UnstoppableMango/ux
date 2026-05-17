package main

import (
	"fmt"
	"io"
	"os"

	"github.com/mattn/go-isatty"
	"github.com/unmango/go/cli"
	"github.com/unstoppablemango/ux/cmd"
)

func main() {
	if isatty.IsTerminal(os.Stdin.Fd()) {
		if err := cmd.Execute(); err != nil {
			cli.Fail(err)
		}
	} else {
		data, err := io.ReadAll(os.Stdin)
		if err != nil {
			cli.Fail(err)
		}
		fmt.Print(string(data))
	}
}
