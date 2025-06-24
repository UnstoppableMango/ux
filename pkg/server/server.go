package server

import (
	"bytes"
	"context"
	"fmt"
	"io"
	"net"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"google.golang.org/grpc"
)

type Server struct {
	uxv1alpha1.UnimplementedUxServiceServer
	input  map[string]io.Reader
	output map[string][]byte
}

func (s *Server) Output(name string) (io.Reader, error) {
	if data, ok := s.output[name]; ok {
		return bytes.NewBuffer(data), nil
	} else {
		return nil, fmt.Errorf("no output named: %s", name)
	}
}

func (s *Server) Open(ctx context.Context, req *uxv1alpha1.OpenRequest) (*uxv1alpha1.OpenResponse, error) {
	if req.Name == nil {
		return nil, fmt.Errorf("no input name provided")
	}

	r, ok := s.input[*req.Name]
	if !ok {
		return nil, fmt.Errorf("no input named: %s", *req.Name)
	}

	data, err := io.ReadAll(r)
	if err != nil {
		return nil, err
	}

	return &uxv1alpha1.OpenResponse{
		Data: data,
	}, nil
}

func (s *Server) Write(ctx context.Context, req *uxv1alpha1.WriteRequest) (*uxv1alpha1.WriteResponse, error) {
	if req.Name == nil {
		return nil, fmt.Errorf("no name in request")
	}

	s.output[*req.Name] = req.Data
	return nil, nil
}

func (s *Server) Serve(lis net.Listener) error {
	srv := grpc.NewServer()
	uxv1alpha1.RegisterUxServiceServer(srv, s)

	return srv.Serve(lis)
}

func New() *Server {
	return &Server{output: map[string][]byte{}}
}

func Serve(lis net.Listener) error {
	return New().Serve(lis)
}
