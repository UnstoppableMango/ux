package plugin

import (
	"iter"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
)

type CapMap = iter.Seq2[string, iter.Seq[*uxv1alpha1.Capability]]
