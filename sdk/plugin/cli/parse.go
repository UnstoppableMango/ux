package cli

import (
	"fmt"

	"github.com/unstoppablemango/ux/pkg/host"
	"github.com/unstoppablemango/ux/pkg/ux"
)

type Input struct {
	Host ux.Host
}

func Parse(args []string) (i Input, err error) {
	if len(args) == 0 {
		return i, fmt.Errorf("no arguments provided")
	}
	if len(args) >= 1 {
		if i.Host, err = host.Parse(args[0]); err != nil {
			return i, err
		}
	}

	return
}
