package plugin

import (
	"context"
	"fmt"

	protofsv1alpha1 "github.com/unmango/aferox/protofs/grpc/v1alpha1"
	"github.com/unmango/go/option"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	ux "github.com/unstoppablemango/ux/pkg"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
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
		return nil, nil
	}

	if err := p.injectFs(req); err != nil {
		return nil, err
	}

	return p.gen.Generate(ctx, req)
}

func (p *Plugin) injectFs(req *uxv1alpha1.GenerateRequest) error {
	target, ok := p.gen.(FsInjector)
	if !ok {
		return nil
	}

	conn, err := grpc.NewClient(fmt.Sprint("unix://", req.FsAddress),
		grpc.WithTransportCredentials(insecure.NewCredentials()),
	)
	if err != nil {
		return err
	}

	target.InjectFs(protofsv1alpha1.NewFs(conn))

	return nil
}
