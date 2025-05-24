package plugin

import (
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
)

type Client interface {
	Plugin() uxv1alpha1.PluginServiceClient
	Ux() uxv1alpha1.UxServiceClient
}
