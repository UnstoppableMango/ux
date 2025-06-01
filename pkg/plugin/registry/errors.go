package registry

import (
	"context"

	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/registry/local"
)

type ErrorFilter struct {
	Filter   func(error) bool
	Registry plugin.Registry
}

func (r ErrorFilter) List(ctx context.Context) (plugin.List, error) {
	if plugins, err := r.Registry.List(ctx); r.Filter(err) {
		return plugin.EmptyList, nil
	} else {
		return plugins, err
	}
}

func FilterErrors(registry plugin.Registry, filter func(error) bool) plugin.Registry {
	return ErrorFilter{Registry: registry, Filter: filter}
}

func IgnoreNotFound(registry plugin.Registry) plugin.Registry {
	return FilterErrors(registry, local.IsNotFound)
}
