package registry

import (
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/registry/builder"
)

type Decorator = builder.Decorator

func Decorate(registry plugin.Registry, decorators ...Decorator) plugin.Registry {
	return builder.FromAll(decorators).Apply(registry)
}
