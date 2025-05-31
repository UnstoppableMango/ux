package registry

import (
	"context"

	"github.com/unmango/go/option"
	"github.com/unstoppablemango/ux/pkg/plugin"
)

type ListOptions struct {
	disableDefault bool
	registries     []plugin.Registry
}

type ListOption func(*ListOptions)

func List(ctx context.Context, options ...ListOption) (plugin.List, error) {
	opts := ListOptions{}
	option.ApplyAll(&opts, options)

	return opts.aggregate().List(ctx)
}

func (o ListOptions) aggregate() plugin.Registry {
	if o.disableDefault {
		return Aggregate(o.registries)
	} else {
		return allOrDefault(o.registries, nil)
	}
}

func allOrDefault(registries []plugin.Registry, def plugin.Registry) plugin.Registry {
	if len(registries) > 0 {
		return Aggregate(registries)
	} else {
		return def
	}
}
