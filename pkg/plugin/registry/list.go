package registry

import (
	"context"

	"github.com/unmango/go/option"
	"github.com/unstoppablemango/ux/pkg/plugin"
)

var Default plugin.Registry = Aggregate{UserConfig}

type ListOptions struct {
	disableDefault bool
	registries     []plugin.Registry
}

type ListOption func(*ListOptions)

func AllOrDefault(registries []plugin.Registry) plugin.Registry {
	if len(registries) > 0 {
		return Aggregate(registries)
	} else {
		return Default
	}
}

func List(ctx context.Context, options ...ListOption) (plugin.List, error) {
	opts := ListOptions{}
	option.ApplyAll(&opts, options)

	return opts.aggregate().List(ctx)
}

func (o ListOptions) aggregate() plugin.Registry {
	if o.disableDefault {
		return Aggregate(o.registries)
	} else {
		return AllOrDefault(o.registries)
	}
}
