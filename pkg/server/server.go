package server

import (
	"context"
	"fmt"
	"net"
	"os"
	"path/filepath"

	"github.com/spf13/afero"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"google.golang.org/grpc"
)

type Option func(*Server)

type Server struct {
	uxv1alpha1.UnimplementedUxServiceServer

	input, output afero.Fs
}

func (s *Server) Open(ctx context.Context, req *uxv1alpha1.OpenRequest) (*uxv1alpha1.OpenResponse, error) {
	if req.Name == nil {
		return nil, fmt.Errorf("no input name provided")
	}

	data, err := afero.ReadFile(s.input, *req.Name)
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

	err := afero.WriteFile(s.output, *req.Name, req.Data, os.ModePerm)
	if err != nil {
		return nil, err
	}

	return nil, nil
}

func (s *Server) Server() *grpc.Server {
	srv := grpc.NewServer()
	uxv1alpha1.RegisterUxServiceServer(srv, s)
	return srv
}

func (s *Server) Serve(lis net.Listener) error {
	return s.Server().Serve(lis)
}

func (s *Server) ListenAndServe(sock string) error {
	if lis, err := net.Listen("unix", sock); err != nil {
		return err
	} else {
		return s.Serve(lis)
	}
}

func New(input, output afero.Fs) *Server {
	return &Server{
		input:  input,
		output: output,
	}
}

func WithInput(fs afero.Fs) Option {
	return func(s *Server) {
		s.input = fs
	}
}

func WithOutput(fs afero.Fs) Option {
	return func(s *Server) {
		s.output = fs
	}
}

func Serve(lis net.Listener, options ...Option) error {
	return New(afero.NewOsFs(), afero.NewOsFs()).Serve(lis)
}

func ListenAndServe(sock string, options ...Option) error {
	return New(afero.NewOsFs(), afero.NewOsFs()).ListenAndServe(sock)
}

func TempSocket(dir, pattern string) (string, error) {
	if dir, err := os.MkdirTemp(dir, pattern); err != nil {
		return "", err
	} else {
		return filepath.Join(dir, "ux.sock"), nil
	}
}
