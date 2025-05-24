package plugin

import (
	"context"

	"github.com/charmbracelet/log"
	"github.com/unmango/go/option"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/ux"
	"google.golang.org/grpc"
)

// This whole API is a little weird, I'll probably redo it

type Plugin struct {
	Handler

	grpc []grpc.DialOption

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

func WithDialOptions(options ...grpc.DialOption) Option {
	return func(p *Plugin) {
		p.grpc = append(p.grpc, options...)
	}
}

func (p *Plugin) Acknowledge(ctx context.Context, host ux.Host) error {
	log := log.FromContext(ctx)

	log.Debug("Connecting to host", "host", host)
	client, err := Dial(host, p.grpc...)
	if err != nil {
		return err
	}

	log.Info("Acknowledging invocation")
	ack, err := client.V1Alpha1().Acknowledge(ctx, &uxv1alpha1.AcknowledgeRequest{
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
	res, err := client.V1Alpha1().Complete(ctx, &uxv1alpha1.CompleteRequest{
		RequestId: ack.RequestId,
		Payload:   output,
	})
	if err != nil {
		return err
	}

	if !res.HeadPat { // Sad...
		log.Debug("No head pat")
	}

	return nil
}
