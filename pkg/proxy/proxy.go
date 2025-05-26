package proxy

import uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"

type Operation[I, O any] interface {
	Wait() I
	Send(O)
}

type Proxy struct {
	svc *Service
}

func New(svc *Service) *Proxy {
	return &Proxy{svc}
}

func (p *Proxy) Acknowledge() Operation[*uxv1alpha1.AcknowledgeRequest, *uxv1alpha1.AcknowledgeResponse] {
	return p.svc.acknowledge
}

func (p *Proxy) Complete() Operation[*uxv1alpha1.CompleteRequest, *uxv1alpha1.CompleteResponse] {
	return p.svc.complete
}
