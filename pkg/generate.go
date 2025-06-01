package ux

import (
	"context"

	"github.com/charmbracelet/log"
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
