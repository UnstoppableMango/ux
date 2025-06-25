package server

import (
	"bytes"
	"context"
	"fmt"
	"io"
	"maps"
	"net"
	"os"
	"path/filepath"

	"github.com/charmbracelet/log"
	"github.com/unmango/go/option"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"google.golang.org/grpc"
)

type Option func(*Server)

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
		log.Infof("Inputs: %v", s.input)
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

func New(options ...Option) *Server {
	s := &Server{
		input:  map[string]io.Reader{},
		output: map[string][]byte{},
	}
	option.ApplyAll(s, options)

	return s
}

func WithInput(name string, r io.Reader) Option {
	return func(s *Server) {
		s.input[name] = r
	}
}

func WithInputs(input map[string]io.Reader) Option {
	return func(s *Server) {
		maps.Copy(s.input, input)
	}
}

func Serve(lis net.Listener, options ...Option) error {
	return New(options...).Serve(lis)
}

func ListenAndServe(sock string, options ...Option) error {
	return New(options...).ListenAndServe(sock)
}

func TempSocket(dir, pattern string) (string, error) {
	if dir, err := os.MkdirTemp(dir, pattern); err != nil {
		return "", err
	} else {
		return filepath.Join(dir, "ux.sock"), nil
	}
}
