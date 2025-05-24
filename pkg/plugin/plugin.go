package plugin

import (
	"context"

	"github.com/charmbracelet/log"
	"github.com/unmango/go/option"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
)

// This whole API is a little weird, I might redo it

type Plugin struct {
	Handler
	uxv1alpha1.PluginServiceClient
	Name string
	Caps []uxv1alpha1.Capability
}

type Option func(*Plugin)

func New(name string, handler Handler, options ...Option) *Plugin {
	plugin := &Plugin{
		Name:    name,
		Handler: handler,
	}
	option.ApplyAll(plugin, options)

	return plugin
}

func WithClient(c Client) Option {
	return func(p *Plugin) {
		p.PluginServiceClient = c.Plugin()
	}
}

func WithCapability(from, to string, lossy bool) Option {
	return WithCapabilities(uxv1alpha1.Capability{
		From:  from,
		To:    to,
		Lossy: lossy,
	})
}

func WithCapabilities(capabilities ...uxv1alpha1.Capability) Option {
	return func(p *Plugin) {
		p.Caps = append(p.Caps, capabilities...)
	}
}

func (p *Plugin) Invoke(ctx context.Context) error {
	log := log.FromContext(ctx)

	log.Info("Acknowledging invocation")
	ack, err := p.Acknowledge(ctx, &uxv1alpha1.AcknowledgeRequest{
		Name: p.Name,
	})
	if err != nil {
		return err
	}

	log.Info("Invoking plugin generator")
	output, err := p.Generate(ctx, ack.Payload)
	if err != nil {
		return err
	}

	log.Info("Completing request")
	res, err := p.Complete(ctx, &uxv1alpha1.CompleteRequest{
		RequestId: ack.RequestId,
		Payload:   output,
	})
	if err != nil {
		return err
	}

	if !res.HeadPat {
		// Sad...
		log.Debug("No head pat")
	}

	return nil
}
