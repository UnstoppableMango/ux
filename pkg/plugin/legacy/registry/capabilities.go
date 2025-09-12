package registry

import (
	"context"
	"maps"
	"slices"

	"github.com/charmbracelet/log"
	"github.com/unmango/go/iter"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/legacy/registry/list"
)

func Capabilities(ctx context.Context, options ...list.Option) (plugin.CapMap, error) {
	plugins, err := List(ctx, options...)
	if err != nil {
		return nil, err
	}

	capabilities := map[string]iter.Seq[*uxv1alpha1.Capability]{}
	for name, p := range plugins {
		if res, err := p.Capabilities(ctx, &uxv1alpha1.CapabilitiesRequest{}); err != nil {
			log.Debug("Failed to look up capabilities", "name", name, "err", err)
		} else {
			capabilities[name] = slices.Values(res.All)
		}
	}

	return maps.All(capabilities), nil
}
