package ux

import uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"

type (
	Config         = uxv1alpha1.Config
	Derivation     = uxv1alpha1.Derivation
	InvokeRequest  = uxv1alpha1.InvokeRequest
	InvokeResponse = uxv1alpha1.InvokeResponse
	Source         = uxv1alpha1.Source
	FlakeSource    = uxv1alpha1.Source_Flake
	GitSource      = uxv1alpha1.Source_Git
	OciSource      = uxv1alpha1.Source_Oci
)
