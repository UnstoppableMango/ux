package plugin

import (
	"context"

	"github.com/unmango/go/option"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	ux "github.com/unstoppablemango/ux/pkg"
)

type Option func(*Plugin)

type Plugin struct {
	uxv1alpha1.UnimplementedPluginServiceServer
	caps []*uxv1alpha1.Capability
	gen  ux.Generator
}

func WithCapabilities(caps ...*uxv1alpha1.Capability) Option {
	return WithAllCapabilities(caps)
}

func WithAllCapabilities(caps []*uxv1alpha1.Capability) Option {
	return func(p *Plugin) {
		p.caps = append(p.caps, caps...)
	}
}

func WithGenerator(generator ux.Generator) Option {
	return func(p *Plugin) {
		p.gen = generator
	}
}

func New(options ...Option) *Plugin {
	p := &Plugin{}
	option.ApplyAll(p, options)

	return p
}

func (p *Plugin) Capabilities(context.Context, *uxv1alpha1.CapabilitiesRequest) (*uxv1alpha1.CapabilitiesResponse, error) {
	return &uxv1alpha1.CapabilitiesResponse{All: p.caps}, nil
}

func (p *Plugin) Generate(ctx context.Context, req *uxv1alpha1.GenerateRequest) (*uxv1alpha1.GenerateResponse, error) {
	if p.gen != nil {
		return p.gen.Generate(ctx, req)
	} else {
		return nil, nil
	}
}
