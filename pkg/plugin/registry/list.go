package registry

import (
	"context"
	"iter"

	"github.com/unmango/go/option"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/ux"
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

func List(ctx context.Context, options ...ListOption) (iter.Seq2[string, ux.Plugin], error) {
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
