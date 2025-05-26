package registry

import (
	"context"

	"github.com/unmango/go/iter"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/plugin"
)

type Filtered struct {
	Filter   func(string, ux.Plugin) bool
	Registry plugin.Registry
}

func (r Filtered) List(ctx context.Context) (plugin.List, error) {
	if plugins, err := r.Registry.List(ctx); err != nil {
		return nil, err
	} else {
		return iter.Filter2(plugins, r.Filter), nil
	}
}
