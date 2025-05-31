package registry

import (
	"context"
	"maps"

	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/plugin"
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
