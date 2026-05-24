package ux

import (
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/config"
)

var defaultConfig = uxv1alpha1.Config_builder{
	Sources: map[string]*uxv1alpha1.Source{
		"local": config.FlakeSource(".#"),
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
