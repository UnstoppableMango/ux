package plugin

import (
	"context"
	"fmt"
	"time"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/proxy"
)

type Handler interface {
	Acknowledge(context.Context, *uxv1alpha1.AcknowledgeRequest) (*uxv1alpha1.AcknowledgeResponse, error)
	Complete(context.Context, *uxv1alpha1.CompleteRequest) (*uxv1alpha1.CompleteResponse, error)
}

type Proxy struct {
	handler Handler
}

func (p *Proxy) Invoke(ctx context.Context, host string) error {
	svc, err := proxy.Start(ctx, host)
	if err != nil {
		return err
	}

	ctx, cancel := context.WithTimeout(ctx, 15*time.Second)
	defer cancel()

	var req *uxv1alpha1.AcknowledgeRequest
	select {
	case <-ctx.Done():
		return fmt.Errorf("invocation was not acknowledged")
	case req = <-proxy.Acknowledged(svc):
	}

	res, err := p.handler.Acknowledge(ctx, req)
	if err != nil {
		return err
	}

	proxy.Acknowledge(svc, res)
}
