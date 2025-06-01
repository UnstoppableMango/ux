package input

import (
	"context"
	"fmt"
	"maps"

	"github.com/unmango/go/iter"
	ux "github.com/unstoppablemango/ux/pkg"
)

func Plan(ctx context.Context, input ux.Input) (ux.Plan, error) {
	head, err := Head(input)
	if err != nil {
		return nil, err
	}

	target, err := Target(input)
	if err != nil {
		return nil, err
	}

	caps, err := Capabilities(ctx, input)
	if err != nil {
		return nil, err
	}

	plugins := maps.Collect(input.Plugins())
	for name, c := range caps {
		for x := range c {
			// Exact match
			if x.From == head && x.To == target {
				return iter.Singleton(plugins[name]), nil
			}
		}
	}

	return nil, fmt.Errorf("unable to generate plan for input")
}
