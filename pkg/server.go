package ux

import (
	"context"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"
)

type UX struct {
	uxv1alpha1.UnimplementedUxServiceServer
}

func NewServer() uxv1alpha1.UxServiceServer {
	return &UX{}
}

func (s *UX) Invoke(ctx context.Context, req *InvokeRequest) (*InvokeResponse, error) {
	cfg := req.GetConfig()
	msgs, err := Invoke(ctx, cfg, req.GetUxFile())
	if err != nil {
		return nil, err
	}

	resp := uxv1alpha1.InvokeResponse_builder{
		Links:    cfg.GetLinks(),
		Messages: msgs,
	}
	return resp.Build(), nil
}
