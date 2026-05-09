package ux

import uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"

var config = uxv1alpha1.Config_builder{
	Repos: []*Repo{},
	Links: []*Link{},
}

var DefaultConfig *Config = config.Build()

func GetConfig(req *InvokeRequest, fallback *Config) *Config {
	cfg := req.GetConfig()
	if cfg != nil {
		return cfg
	}
	return fallback
}
