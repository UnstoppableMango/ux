package registry

import (
	"context"

	"github.com/unmango/go/iter"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/registry/list"
)

func Capabilities(ctx context.Context, options ...list.Option) (plugin.CapMap, error) {
	plugins, err := List(ctx, options...)
	if err != nil {
		return nil, err
	}

	iter.Map2[]()

	return nil, nil
}
