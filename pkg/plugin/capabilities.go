package plugin

import (
	"context"
	"iter"
	"slices"

	"github.com/unmango/go/result"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	ux "github.com/unstoppablemango/ux/pkg"
)

type CapMap = iter.Seq2[string, iter.Seq[*uxv1alpha1.Capability]]

func Capabilities(ctx context.Context, plugin ux.Plugin) result.Result[iter.Seq[*uxv1alpha1.Capability]] {
	if res, err := plugin.Capabilities(ctx, &uxv1alpha1.CapabilitiesRequest{}); err != nil {
		return result.Err[iter.Seq[*uxv1alpha1.Capability]](err)
	} else {
		return result.Ok(slices.Values(res.All))
	}
}
