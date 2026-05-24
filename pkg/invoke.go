package ux

import (
	"context"
	"io"

	"charm.land/log/v2"
	nixv1alpha1 "github.com/unstoppablemango/ux/gen/nix/v1alpha1"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/config"
	"github.com/unstoppablemango/ux/pkg/nix"
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
	common := &nixv1alpha1.CommonOptions_builder{
		Expr: new("import ./nix/builders/buf/generate.nix {}"),
	}
	req := &nixv1alpha1.InstantiateRequest_builder{
		Common: common.Build(),
	}
	res, err := nix.Instantiate(ctx, req.Build())
	if err != nil {
		return err
	}
	if res.HasResult() {
		r := res.GetResult()
		log.Info("nix-instantiate",
			"stdout", r.GetStdout(),
			"stderr", r.GetStderr(),
			"exitCode", r.GetExitCode(),
		)
	}
	return nil
}

func InvokeStdin(stdin io.Reader) error {
	cfg, err := config.ReadJSON(stdin)
	if err != nil {
		return err
	}
	return Invoke(context.Background(), cfg)
}
