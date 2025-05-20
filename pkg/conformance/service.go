package conformance

import (
	"context"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
)

type PluginService struct {
	uxv1alpha1.UnimplementedPluginServiceServer
	Requests []*uxv1alpha1.RegisterRequest
}

func (s *PluginService) Register(_ context.Context, req *uxv1alpha1.RegisterRequest) (*uxv1alpha1.RegisterResponse, error) {
	s.Requests = append(s.Requests, req)
	return &uxv1alpha1.RegisterResponse{}, nil
}
