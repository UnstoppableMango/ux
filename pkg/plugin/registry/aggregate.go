package registry

import (
	"context"
	"iter"
	"maps"

	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/ux"
)

type Aggregate []plugin.Registry

func (registries Aggregate) List(ctx context.Context) (iter.Seq2[string, ux.Plugin], error) {
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
