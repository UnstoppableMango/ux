package config

import uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"

func ToSpec(cfg Config) *uxv1alpha1.Config {
	b := &uxv1alpha1.Config_builder{}
	for _, link := range cfg.Links {
		b.Links = append(b.Links, linkToSpec(link))
	}
	return b.Build()
}

func linkToSpec(link Link) *uxv1alpha1.Link {
	b := &uxv1alpha1.Link_builder{
		Derivation:  drvToSpec(link.Derivation),
		Destination: destToSpec(link.Destination),
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

func destToSpec(dest *Destination) *uxv1alpha1.Destination {
	if dest == nil {
		return nil
	}
	b := &uxv1alpha1.Destination_builder{
		RelativePath: dest.RelativePath,
	}
	return b.Build()
}
