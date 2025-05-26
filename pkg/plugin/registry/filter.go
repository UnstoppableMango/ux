package registry

import (
	"context"

	"github.com/unmango/go/iter"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/ux"
)

type Filtered struct {
	Filter   func(string, ux.Plugin) bool
	Registry plugin.Registry
}

func (r Filtered) List(ctx context.Context) (iter.Seq2[string, ux.Plugin], error) {
	if plugins, err := r.Registry.List(ctx); err != nil {
		return nil, err
	} else {
		return iter.Filter2(plugins, r.Filter), nil
	}
}
