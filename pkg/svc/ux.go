package svc

import (
	"context"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
)

type Ux struct {
	uxv1alpha1.UnimplementedUxServiceServer
}

func (Ux) Generate(context.Context, *uxv1alpha1.GenerateRequest) (*uxv1alpha1.GenerateResponse, error) {
	return nil, nil
}
