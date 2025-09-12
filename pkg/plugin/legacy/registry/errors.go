package registry

import (
	"context"

	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/legacy/registry/local"
)

type ErrorFilter struct {
	Filter   func(error) bool
	Registry plugin.LegacyRegistry
}

func (r ErrorFilter) List(ctx context.Context) (plugin.List, error) {
	if plugins, err := r.Registry.List(ctx); r.Filter(err) {
		return plugin.EmptyList, nil
	} else {
		return plugins, err
	}
}

func FilterErrors(registry plugin.LegacyRegistry, filter func(error) bool) plugin.LegacyRegistry {
	return ErrorFilter{Registry: registry, Filter: filter}
}

func IgnoreNotFound(registry plugin.LegacyRegistry) plugin.LegacyRegistry {
	return FilterErrors(registry, local.IsNotFound)
}
