package list

import (
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/registry"
	"github.com/unstoppablemango/ux/pkg/plugin/registry/internal"
)

type Options struct {
	disableDefault bool
	registries     []plugin.Registry
}

type Option func(*Options)

func (o Options) Aggregate() plugin.Registry {
	if o.disableDefault {
		return registry.Aggregate(o.registries)
	} else {
		return AllOrDefault(o.registries)
	}
}

func AllOrDefault(registries []plugin.Registry) plugin.Registry {
	if len(registries) > 0 {
		return registry.Aggregate(registries)
	} else {
		return internal.Default()
	}
}
