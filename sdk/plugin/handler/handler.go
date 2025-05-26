package handler

import (
	"context"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/sdk/plugin"
)

var (
	NoOp    = Anonymous(noOp)
	NewMock = plugin.NewMockHandler
)

type Mock = plugin.MockHandler

type Anonymous func(context.Context, *uxv1alpha1.Payload) (*uxv1alpha1.Payload, error)

// Generate implements plugin.Handler.
func (handle Anonymous) Generate(ctx context.Context, payload *uxv1alpha1.Payload) (*uxv1alpha1.Payload, error) {
	return handle(ctx, payload)
}

func noOp(context.Context, *uxv1alpha1.Payload) (*uxv1alpha1.Payload, error) {
	return nil, nil
}
