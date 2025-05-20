package main

import (
	"fmt"
	"os"

	"github.com/unstoppablemango/ux/pkg/plugin/cli"
)

func main() {
	input, err := cli.Parse(os.Args[1:])
	if err != nil {
		cli.Fail(err)
	}

	fmt.Println("Parsed input: ", input)
}
