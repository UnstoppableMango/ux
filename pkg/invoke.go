package ux

import (
	"context"
	"fmt"
	"io"

	"charm.land/log/v2"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/config"
)

func Invoke(ctx context.Context, config *Config) error {
	for name, generator := range config.GetGenerate() {
		log.Info("Generator", "name", name)
		if err := Generate(ctx, config, generator); err != nil {
			return err
		}
	}
	return nil
}

func Generate(ctx context.Context, cfg *Config, gen *uxv1alpha1.Generate) error {
	builder := config.LookupBuilder(cfg, gen.GetBuilder())
	return Build(ctx, builder, gen.GetConfig())
}

func Build(ctx context.Context, builder string, config map[string]string) error {
	return fmt.Errorf("TODO")
}

func InvokeStdin(stdin io.Reader) error {
	cfg, err := config.ReadJSON(stdin)
	if err != nil {
		return err
	}
	return Invoke(context.Background(), cfg)
}
