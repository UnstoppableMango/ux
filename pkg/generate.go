package ux

import (
	"context"

	"github.com/charmbracelet/log"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
)

func Generate(ctx context.Context, input Input) error {
	for name := range input.Sources() {
		log.Info("Source", "name", name)
	}
	for name := range input.Sinks() {
		log.Info("Sink", "name", name)
	}

	return nil
}


func Goal(input Input) *uxv1alpha1.Capability {
	return nil
}
