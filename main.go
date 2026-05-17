package main

import (
	"fmt"
	"io"
	"os"

	"github.com/unmango/go/cli"
	"github.com/unstoppablemango/ux/cmd"
)

func main() {
	stat, _ := os.Stdin.Stat()
	if (stat.Mode() & os.ModeCharDevice) == 0 {
		data, err := io.ReadAll(os.Stdin)
		if err != nil {
			cli.Fail(err)
		}
		fmt.Print(string(data))
		return
	} else {
		fmt.Println("stdin is from a terminal")
	}

	if err := cmd.Execute(); err != nil {
		cli.Fail(err)
	}
}
