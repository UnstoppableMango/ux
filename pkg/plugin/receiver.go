package plugin

import (
	"context"
	"fmt"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
)

type handler[T, V any] struct {
	in  chan T
	out chan V
}

func (h handler[T, V]) On() <-chan T {
	return h.in
}

func (h handler[T, V]) Send(msg V) {
	h.out <- msg
}

func (h handler[T, V]) handle(ctx context.Context, req T) (res V, err error) {
	h.in <- req

	select {
	case <-ctx.Done():
		return res, fmt.Errorf("no response sent: %w", ctx.Err())
	case msg := <-h.out:
		return msg, nil
	}
}

type Receiver struct {
	uxv1alpha1.UnimplementedPluginServiceServer

	ack handler[*uxv1alpha1.AcknowledgeRequest, *uxv1alpha1.AcknowledgeResponse]
	com handler[*uxv1alpha1.CompleteRequest, *uxv1alpha1.CompleteResponse]
}

func (r *Receiver) Acknowledge(ctx context.Context, req *uxv1alpha1.AcknowledgeRequest) (*uxv1alpha1.AcknowledgeResponse, error) {
	return r.ack.handle(ctx, req)
}

func (r *Receiver) Complete(ctx context.Context, req *uxv1alpha1.CompleteRequest) (*uxv1alpha1.CompleteResponse, error) {
	return r.com.handle(ctx, req)
}
