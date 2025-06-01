package source

import (
	"context"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	ux "github.com/unstoppablemango/ux/pkg"
)

func Payload(ctx context.Context, contentType string, source ux.Source) (*uxv1alpha1.Payload, error) {
	if data, err := ReadAll(ctx, source); err != nil {
		return nil, err
	} else {
		return &uxv1alpha1.Payload{
			ContentType: contentType,
			Data:        data,
		}, nil
	}
}
