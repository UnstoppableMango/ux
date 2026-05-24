package config

import uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"

func FlakeSource(installable string) *uxv1alpha1.Source {
	flake := uxv1alpha1.Source_Flake_builder{
		Installable: new(installable),
	}
	b := &uxv1alpha1.Source_builder{
		Flake: flake.Build(),
	}
	return b.Build()
}
