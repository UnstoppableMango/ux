package proxy

import (
	"context"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
)

type Handler interface {
	Acknowledge(context.Context, *uxv1alpha1.AcknowledgeRequest) (*uxv1alpha1.AcknowledgeResponse, error)
	Complete(context.Context, *uxv1alpha1.CompleteRequest) (*uxv1alpha1.CompleteResponse, error)
}
