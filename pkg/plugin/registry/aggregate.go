package registry

import (
	"context"
	"maps"

	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/ux"
)

type Aggregate []plugin.Registry

func (registries Aggregate) List(ctx context.Context) (plugin.List, error) {
	plugins := map[string]ux.Plugin{}
	for _, r := range registries {
		if list, err := r.List(ctx); err != nil {
			return nil, err
		} else {
			maps.Insert(plugins, list)
		}
	}

	return maps.All(plugins), nil
}
