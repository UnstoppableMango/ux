package target

import (
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	ux "github.com/unstoppablemango/ux/pkg"
)

func AssessAll(target ux.Target, caps []*uxv1alpha1.Capability) map[*uxv1alpha1.Capability]ux.Criteria {
	criteria := map[*uxv1alpha1.Capability]ux.Criteria{}
	for _, c := range caps {
		criteria[c] = target.Assess(c)
	}

	return criteria
}
