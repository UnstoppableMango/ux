package cap

import (
	"github.com/unmango/go/iter"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
)

func Next(
	capabilities iter.Seq[*uxv1alpha1.Capability],
	goal *uxv1alpha1.Capability,
) *uxv1alpha1.Capability {
	for _, reduce := range reducers {
		capabilities = reduce(capabilities, goal)
	}
	for cap := range capabilities {
		return cap // First
	}

	return nil
}
