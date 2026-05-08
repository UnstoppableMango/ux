package ux

import (
	"context"

	"github.com/nix-community/go-nix/pkg/derivation/store"
	"github.com/nix-community/go-nix/pkg/nixpath"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"
)

func Invoke(ctx context.Context, config *Config) error {
	for _, pkg := range config.GetPackages() {
		switch pkg.WhichSource() {
		case uxv1alpha1.Package_Derivation_case:
			return handleDrv(ctx, pkg.GetDerivation())
		}
	}
	return nil
}

func handleDrv(ctx context.Context, req *Derivation) error {
	s, err := store.NewFSStore(nixpath.StoreDir)
	if err != nil {
		return err
	}
	defer s.Close()

	drv, err := s.Get(ctx, req.GetPath())
	if err != nil {
		return err
	}

	return nil
}
