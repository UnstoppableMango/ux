package input

import (
	"context"

	ux "github.com/unstoppablemango/ux/pkg"
)

func Generate(ctx context.Context, input ux.Input) error {
	goal, err := Goal(input)
	if err != nil {
		return err
	}

	caps, err := Capabilities(ctx, input)
	if err != nil {
		return err
	}

	return nil
}
