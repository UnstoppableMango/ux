package ux

import (
	"context"
	"fmt"
	"strings"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"
)

type (
	Config         = uxv1alpha1.Config
	ConfigBuilder  = uxv1alpha1.Config_builder
	Repo           = uxv1alpha1.Repo
	Derivation     = uxv1alpha1.Derivation
	Package        = uxv1alpha1.Package
	InvokeRequest  = uxv1alpha1.InvokeRequest
	InvokeResponse = uxv1alpha1.InvokeResponse
)

type UX struct {
	uxv1alpha1.UnimplementedUxServiceServer
}

func (s *UX) Invoke(ctx context.Context, req *InvokeRequest) (*InvokeResponse, error) {
	out := &strings.Builder{}
	cfg := GetConfig(req, DefaultConfig)
	for _, pkg := range cfg.GetPackages() {
		if r, err := Instantiate(ctx, pkg); err != nil {
			return nil, err
		} else {
			fmt.Fprintln(out, r.GetOutput())
		}
	}

	resp := uxv1alpha1.InvokeResponse_builder{
		Output: new(out.String()),
	}
	return resp.Build(), nil
}

func NewServer() uxv1alpha1.UxServiceServer {
	return &UX{}
}
