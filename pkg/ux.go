package ux

import (
	"context"
	"io"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
)

type Option interface {
	Name(string)
	Alias(string)
}

type Configure interface {
	Configure(Option)
}

type Builder interface {
	Input(Configure) string
}

type Context interface {
	Context() context.Context
	Input(string) (io.Reader, error)
	Output(string) (io.Writer, error)
}

type Generator interface {
	Configure(Builder) error
	Generate(Context) error
}

type LegacyPlugin interface {
	Capabilities(context.Context, *uxv1alpha1.CapabilitiesRequest) (*uxv1alpha1.CapabilitiesResponse, error)
	Generate(context.Context, *uxv1alpha1.GenerateRequest) (*uxv1alpha1.GenerateResponse, error)
}
