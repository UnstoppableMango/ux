package ux

import uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"

var localFlake = uxv1alpha1.Source_Flake_builder{}

var defaultConfig = uxv1alpha1.Config_builder{
	Sources: map[string]*uxv1alpha1.Source{
		"local": (&uxv1alpha1.Source_builder{
			Name:  new(""),
			Flake: localFlake.Build(),
		}).Build(),
	},
}

var DefaultConfig *Config = defaultConfig.Build()

func GetConfig(req *InvokeRequest, fallback *Config) *Config {
	cfg := req.GetConfig()
	if cfg != nil {
		return cfg
	}
	return fallback
}
