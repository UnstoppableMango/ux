package ux

import (
	"context"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
)

type Generator interface {
	Generate(context.Context, *uxv1alpha1.GenerateRequest) (*uxv1alpha1.GenerateResponse, error)
}

type Plugin interface {
	Generator

	Capabilities(context.Context, *uxv1alpha1.CapabilitiesRequest) (*uxv1alpha1.CapabilitiesResponse, error)
}
