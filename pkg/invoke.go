package ux

import (
	"context"
	"fmt"

	"charm.land/log/v2"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/nix"
)

var ErrNoDestination = fmt.Errorf("link has no destination")

func Invoke(ctx context.Context, config *Config) error {
	for _, link := range config.GetLinks() {
		if err := handle(ctx, link); err != nil {
			return err
		}
	}
	return nil
}

func handle(ctx context.Context, link *Link) error {
	switch link.WhichSource() {
	case uxv1alpha1.Link_Derivation_case:
		return handleDrv(ctx, link)
	default:
		log.Debug("Nothing to do")
		return nil
	}
}

func handleDrv(ctx context.Context, link *Link) error {
	if !link.HasDestination() {
		return ErrNoDestination
	}

	dest := link.GetDestination()
	if !dest.HasRelativePath() {
		return fmt.Errorf("missing relative_path: %w", ErrNoDestination)
	}

	return nix.Realise(ctx,
		[]string{link.GetDerivation().GetPath()},
		[]string{dest.GetRelativePath()},
	)
}

func linkName(link *Link) string {
	if !link.HasName() {
		return "<nil>"
	}
	n := link.GetName()
	if n == "" {
		return "<empty>"
	}
	return n
}
