package ux

import (
	"context"
	"fmt"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/nix"
)

func Invoke(ctx context.Context, config *Config) error {
	for _, link := range config.GetLinks() {
		switch link.WhichSource() {
		case uxv1alpha1.Link_Derivation_case:
			return handleDrv(ctx, link, link.GetDerivation())
		}
	}
	return nil
}

func handleDrv(
	ctx context.Context,
	link *uxv1alpha1.Link,
	drv *uxv1alpha1.Derivation,
) error {
	switch link.WhichDestination() {
	case uxv1alpha1.Link_RelativePath_case:
		return nix.Realise(ctx,
			[]string{drv.GetPath()},
			[]string{link.GetRelativePath()},
		)
	default:
		return fmt.Errorf("unsupported destination")
	}
}
