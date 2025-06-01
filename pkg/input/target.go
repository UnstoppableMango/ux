package input

import (
	"fmt"
	"slices"

	"github.com/unmango/go/iter"
	ux "github.com/unstoppablemango/ux/pkg"
)

func Target(input ux.Input) (string, error) {
	if t := slices.Collect(Targets(input)); len(t) == 1 {
		return t[0], nil
	} else {
		return "", fmt.Errorf("input has multiple targets: %v", t)
	}
}

func Targets(input ux.Input) iter.Seq[string] {
	return iter.DropLast2(input.Sinks())
}
