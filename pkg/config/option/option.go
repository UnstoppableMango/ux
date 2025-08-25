package option

import (
	ux "github.com/unstoppablemango/ux/pkg"
)

type named string

// Configure implements ux.Configure.
func (n named) Configure(o ux.Option) {
	o.Name(string(n))
}

func Named(b ux.Builder, name string) string {
	return b.Input(named(name))
}
