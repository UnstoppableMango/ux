package sink

import (
	"context"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	ux "github.com/unstoppablemango/ux/pkg"
)

func WritePayload(ctx context.Context, sink ux.Sink, payload *uxv1alpha1.Payload) error {
	_, err := Write(ctx, sink, payload.Data)
	return err
}
