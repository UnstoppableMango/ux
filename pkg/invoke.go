package ux

import (
	"context"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/nix"
)

func Invoke(ctx context.Context, config *Config) error {
	for _, link := range config.GetLinks() {
		switch link.WhichSource() {
		case uxv1alpha1.Link_Derivation_case:
			return handleDrv(ctx, link.GetDerivation())
		}
	}
	return nil
}

func handleDrv(ctx context.Context, req *uxv1alpha1.Derivation) error {
	return nix.Realise(ctx, []string{req.GetPath()}, true)
}
