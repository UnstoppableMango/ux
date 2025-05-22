package conformance

import (
	"context"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
)

type PluginService struct {
	uxv1alpha1.UnimplementedPluginServiceServer
	Requests []*uxv1alpha1.AcknowledgeRequest
}

func (s *PluginService) Acknowledge(_ context.Context, req *uxv1alpha1.AcknowledgeRequest) (*uxv1alpha1.AcknowledgeResponse, error) {
	s.Requests = append(s.Requests, req)
	return &uxv1alpha1.AcknowledgeResponse{}, nil
}
