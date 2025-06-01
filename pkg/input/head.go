package input

import (
	"fmt"
	"slices"

	"github.com/unmango/go/iter"

	ux "github.com/unstoppablemango/ux/pkg"
)

func Head(input ux.Input) (string, error) {
	if h := slices.Collect(Heads(input)); len(h) == 1 {
		return h[0], nil
	} else {
		return "", fmt.Errorf("input has multiple heads: %v", h)
	}
}

func Heads(input ux.Input) iter.Seq[string] {
	return iter.DropLast2(input.Sources())
}
