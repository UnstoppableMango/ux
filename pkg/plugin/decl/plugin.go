package decl

import "context"

type Ux interface {
	Args() []string
	Context() context.Context
}

type Plugin interface {
	Invoke(ux Ux) error
}

type PluginFunc func(Ux) error

func (fn PluginFunc) Invoke(ux Ux) error {
	return fn(ux)
}
