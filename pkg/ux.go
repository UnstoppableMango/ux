package ux

import (
	"context"
	"io"

	"github.com/google/uuid"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
)

type Input interface {
	File() uuid.UUID
}

type Context interface {
	Context() context.Context
	Input(uuid.UUID) (io.Reader, error)
	Output() (io.Writer, error)
}

type Generator interface {
	Configure(Input) error
	Generate(Context) error
}

type LegacyPlugin interface {
	Capabilities(context.Context, *uxv1alpha1.CapabilitiesRequest) (*uxv1alpha1.CapabilitiesResponse, error)
	Generate(context.Context, *uxv1alpha1.GenerateRequest) (*uxv1alpha1.GenerateResponse, error)
}
