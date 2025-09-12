package registry

import (
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/legacy/registry/builder"
)

type Decorator = builder.Decorator

func Decorate(registry plugin.LegacyRegistry, decorators ...Decorator) plugin.LegacyRegistry {
	return builder.FromAll(decorators).Apply(registry)
}
