package server

import (
	"context"
	"fmt"
	"net"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"google.golang.org/grpc"
)

type Server struct {
	uxv1alpha1.UnimplementedUxServiceServer
	content map[string][]byte
}

func (s *Server) Write(ctx context.Context, req *uxv1alpha1.WriteRequest) (*uxv1alpha1.WriteResponse, error) {
	if req.Name == nil {
		return nil, fmt.Errorf("no name in request")
	}

	s.content[*req.Name] = req.Data
	return nil, nil
}

func New() uxv1alpha1.UxServiceServer {
	return &Server{content: map[string][]byte{}}
}

func Serve(lis net.Listener) error {
	srv := grpc.NewServer()
	uxv1alpha1.RegisterUxServiceServer(srv, New())

	return srv.Serve(lis)
}
