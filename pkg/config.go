package ux

import uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"

var pkg = &uxv1alpha1.Package_builder{
	Name:       new("Testing"),
	Derivation: &uxv1alpha1.Derivation{},
}

var config = uxv1alpha1.Config_builder{
	Repos:    []*Repo{},
	Packages: []*Package{pkg.Build()},
}

var DefaultConfig *Config = config.Build()

func GetConfig(req *InvokeRequest, fallback *Config) *Config {
	cfg := req.GetConfig()
	if cfg != nil {
		return cfg
	}
	return fallback
}
