package builder

import (
	"slices"

	"github.com/unmango/go/iter"
	"github.com/unstoppablemango/ux/pkg/plugin"
)

type Decorator func(plugin.Registry) plugin.Registry

type B iter.Seq[Decorator]

func (decorators B) Apply(registry plugin.Registry) plugin.Registry {
	for decorate := range decorators {
		registry = decorate(registry)
	}

	return registry
}

func From(decorators ...Decorator) B {
	return FromAll(decorators)
}

func FromAll(decorators []Decorator) B {
	return B(slices.Values(decorators))
}
