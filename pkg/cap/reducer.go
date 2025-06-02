package cap

import (
	"github.com/unmango/go/iter"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
)

// Reducers to apply in order
var reducers = []Reducer{Exact, FromOnly}

type Reducer func(
	iter.Seq[*uxv1alpha1.Capability],
	*uxv1alpha1.Capability,
) iter.Seq[*uxv1alpha1.Capability]

func Exact(
	capabilities iter.Seq[*uxv1alpha1.Capability],
	goal *uxv1alpha1.Capability,
) iter.Seq[*uxv1alpha1.Capability] {
	return iter.Filter(capabilities, func(c *uxv1alpha1.Capability) bool {
		return c.From == goal.From && c.To == goal.To
	})
}

func FromOnly(
	capabilities iter.Seq[*uxv1alpha1.Capability],
	goal *uxv1alpha1.Capability,
) iter.Seq[*uxv1alpha1.Capability] {
	return iter.Filter(capabilities, func(c *uxv1alpha1.Capability) bool {
		return c.From == goal.From
	})
}

func Lossless(
	capabilities iter.Seq[*uxv1alpha1.Capability],
	goal *uxv1alpha1.Capability,
) iter.Seq[*uxv1alpha1.Capability] {
	return iter.Filter(capabilities, func(c *uxv1alpha1.Capability) bool {
		return !c.Lossy
	})
}
