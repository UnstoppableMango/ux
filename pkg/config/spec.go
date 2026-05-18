package config

import (
	"maps"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"
)

func ToSpec(cfg Config) *uxv1alpha1.Config {
	b := &uxv1alpha1.Config_builder{}
	maps.Copy(b.Builders, cfg.Builders)
	b.Generate = make(map[string]*uxv1alpha1.Generate, len(cfg.Generate))
	for name, gen := range cfg.Generate {
		b.Generate[name] = generateToSpec(gen)
	}
	return b.Build()
}

func drvToSpec(drv *Derivation) *uxv1alpha1.Derivation {
	if drv == nil {
		return nil
	}
	b := &uxv1alpha1.Derivation_builder{
		Path: drv.Path,
	}
	return b.Build()
}

func generateToSpec(gen Generate) *uxv1alpha1.Generate {
	b := &uxv1alpha1.Generate_builder{
		Builder: &gen.Builder,
		Config:  gen.Config.Get(),
	}
	return b.Build()
}
