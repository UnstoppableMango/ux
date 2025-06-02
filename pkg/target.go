package ux

import uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"

type (
	Criteria map[string]bool
)

type Target interface {
	Assess(*uxv1alpha1.Capability) Criteria
}
