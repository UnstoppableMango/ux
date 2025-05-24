package cli

import "fmt"

func Parse(args []string) (i Input, err error) {
	if len(args) == 0 {
		return i, fmt.Errorf("no arguments provided")
	}
	if len(args) >= 1 {
		i.Host = Host(args[0])
	}

	return
}
