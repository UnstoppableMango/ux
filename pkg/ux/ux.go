package ux

import (
	"context"

	"github.com/unstoppablemango/ux/pkg/config"
)

type Ux struct {
	config.Config
}

func (ux *Ux) Generate(ctx context.Context, input Input) error {
	return nil
}
