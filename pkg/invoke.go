package ux

import (
	"context"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/nix"
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
	return nix.Realise(ctx, []string{req.GetPath()}, true)
}
