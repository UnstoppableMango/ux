package ux

import (
	"context"

	"github.com/nix-community/go-nix/pkg/derivation/store"
	"github.com/nix-community/go-nix/pkg/nixpath"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"
)

func Instantiate(ctx context.Context, pkg *Package) (*InvokeResponse, error) {
	resp := uxv1alpha1.InvokeResponse_builder{}
	switch pkg.WhichSource() {
	case uxv1alpha1.Package_Derivation_case:
		return instDrv(ctx, pkg.GetDerivation())
	}

	return resp.Build(), nil
}

func instDrv(ctx context.Context, req *Derivation) (*InvokeResponse, error) {
	s, err := store.NewFSStore(nixpath.StoreDir)
	if err != nil {
		return nil, err
	}

	drv, err := s.Get(ctx, req.GetName())
	if err != nil {
		return nil, err
	}
	resp := uxv1alpha1.InvokeResponse_builder{
		Output: new("Got here"),
	}
	for name, out := range drv.Outputs {
		resp.Output = new(name + ": " + out.Path)
	}

	return resp.Build(), nil
}
