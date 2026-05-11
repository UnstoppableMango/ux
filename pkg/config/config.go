package config

import uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"

type Derivation struct {
	Path string `yaml:"path"`
}

type Link struct {
	Name       string     `yaml:"name"`
	Derivation Derivation `yaml:"source"`
}

type Config struct {
	Links []Link `yaml:"links"`
}

func ToSpec(cfg Config) *uxv1alpha1.Config {
	b := &uxv1alpha1.Config_builder{}
	for _, link := range cfg.Links {
		b.Links = append(b.Links, linkToSpec(link))
	}
	return b.Build()
}

func linkToSpec(link Link) *uxv1alpha1.Link {
	b := &uxv1alpha1.Link_builder{
		Derivation: drvToSpec(link.Derivation),
	}
	return b.Build()
}

func drvToSpec(drv Derivation) *uxv1alpha1.Derivation {
	b := &uxv1alpha1.Derivation_builder{
		Path: &drv.Path,
	}
	return b.Build()
}
