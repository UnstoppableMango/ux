package ux

import (
	"context"
	"fmt"
	"strings"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"
)

type (
	Config         = uxv1alpha1.Config
	Repo           = uxv1alpha1.Repo
	Derivation     = uxv1alpha1.Derivation
	Package        = uxv1alpha1.Package
	InvokeRequest  = uxv1alpha1.InvokeRequest
	InvokeResponse = uxv1alpha1.InvokeResponse
)

type UX struct {
	uxv1alpha1.UnimplementedUxServiceServer
}

func NewServer() uxv1alpha1.UxServiceServer {
	return &UX{}
}

func (s *UX) Invoke(ctx context.Context, req *InvokeRequest) (*InvokeResponse, error) {
	out := &strings.Builder{}
	if err := Invoke(ctx, GetConfig(req, DefaultConfig)); err != nil {
		fmt.Fprintln(out, err)
	}

	resp := uxv1alpha1.InvokeResponse_builder{
		Output: new(out.String()),
	}
	return resp.Build(), nil
}
