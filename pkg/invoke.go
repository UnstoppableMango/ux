package ux

import (
	"context"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"
)

type (
	Config         = uxv1alpha1.Config
	ConfigBuilder  = uxv1alpha1.Config_builder
	Repo           = uxv1alpha1.Repo
	Package        = uxv1alpha1.Package
	InvokeRequest  = uxv1alpha1.InvokeRequest
	InvokeResponse = uxv1alpha1.InvokeResponse
)

type UX struct {
	uxv1alpha1.UnimplementedUxServiceServer
}

func (s *UX) Invoke(ctx context.Context, req *InvokeRequest) (*InvokeResponse, error) {
	var cfg *Config
	if cfg = req.GetConfig(); cfg == nil {
		cfg = DefaultConfig
	}

	b := uxv1alpha1.InvokeResponse_builder{
		Output: new("Got here"),
	}

	return b.Build(), nil
}

func NewServer() uxv1alpha1.UxServiceServer {
	return &UX{}
}

var cfgBuilder = ConfigBuilder{
	Repos:    []*Repo{},
	Packages: []*Package{},
}

var DefaultConfig *Config = cfgBuilder.Build()
