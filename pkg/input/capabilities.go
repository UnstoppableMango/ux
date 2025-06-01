package input

import (
	"context"
	"iter"
	"maps"
	"slices"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/plugin"
)

func Capabilities(ctx context.Context, input ux.Input) (plugin.CapMap, error) {
	capabilities := map[string]iter.Seq[*uxv1alpha1.Capability]{}
	for name, p := range input.Plugins() {
		if res, err := p.Capabilities(ctx, &uxv1alpha1.CapabilitiesRequest{}); err != nil {
			return nil, err
		} else {
			capabilities[name] = slices.Values(res.All)
		}
	}

	return maps.All(capabilities), nil
}
