package ux

import uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"

var defaultConfig = uxv1alpha1.Config_builder{
	Registries: map[string]*Registry{},
}

var DefaultConfig *Config = defaultConfig.Build()

func GetConfig(req *InvokeRequest, fallback *Config) *Config {
	cfg := req.GetConfig()
	if cfg != nil {
		return cfg
	}
	return fallback
}
