package plugin

import (
	"iter"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	ux "github.com/unstoppablemango/ux/pkg"
)

type Inventory = iter.Seq2[*uxv1alpha1.Capability, ux.Plugin]
