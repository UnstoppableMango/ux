package cap

import (
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/criteria"
)

type Target struct {
	cap *uxv1alpha1.Capability
}

func NewTarget(cap *uxv1alpha1.Capability) Target {
	return Target{cap}
}

func (t Target) Assess(cap *uxv1alpha1.Capability) ux.Criteria {
	return ux.Criteria{
		criteria.From:  t.cap.From == cap.From,
		criteria.To:    t.cap.To == cap.To,
		criteria.Exact: t.cap.From == cap.From && cap.To == cap.To,
		criteria.Lossy: t.cap.Lossy,
	}
}
