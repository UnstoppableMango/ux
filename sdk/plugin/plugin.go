package plugin

import (
	"context"

	"github.com/charmbracelet/log"
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
	if p.gen == nil {
		log.Warn("No generator supplied")
		return nil, nil
	}

	if target, ok := p.gen.(FsInjector); ok {
		log.Debug("Injecting output fs")
		if fs, err := OutputFs(req); err != nil {
			return nil, err
		} else {
			target.InjectFs(fs)
		}
	}

	return p.gen.Generate(ctx, req)
}
