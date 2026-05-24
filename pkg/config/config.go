package config

import (
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"
)

func LookupSource(cfg *uxv1alpha1.Config, name string) *uxv1alpha1.Source {
	sources := cfg.GetSources()
	if src, ok := sources[name]; ok {
		return src
	}
	return nil
}

func LookupBuilder(cfg *uxv1alpha1.Config, name string) string {
	builders := cfg.GetBuilders()
	b, ok := builders[name]
	if !ok {
		return ""
	}
	return b
}
