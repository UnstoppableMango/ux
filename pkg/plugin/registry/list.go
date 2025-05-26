package registry

import (
	"context"
	"iter"

	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/ux"
)

var Default plugin.Registry = Aggregate{UserConfig}

type ListOptions struct {
	registries []plugin.Registry
}

type ListOption func(*ListOptions)

func AllOrDefault(registries []plugin.Registry) plugin.Registry {
	if len(registries) > 0 {
		return Aggregate(registries)
	} else {
		return Default
	}
}

func List(ctx context.Context, registries ...plugin.Registry) (iter.Seq2[string, ux.Plugin], error) {
	return AllOrDefault(registries).List(ctx)
}
