package registry

import (
	"context"

	"github.com/unmango/go/option"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/registry/list"
)

func List(ctx context.Context, options ...list.Option) (plugin.List, error) {
	opts := list.Options{}
	option.ApplyAll(&opts, options)

	return opts.Aggregate().List(ctx)
}
