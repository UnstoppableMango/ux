package main

import (
	"fmt"
	"os"
)

var version = "development"

func main() {
	if len(os.Args) > 1 && os.Args[1] == "version" {
		fmt.Println(version)
		return
	}

	fmt.Fprintln(os.Stderr, "usage: ux version")
	os.Exit(1)
}
