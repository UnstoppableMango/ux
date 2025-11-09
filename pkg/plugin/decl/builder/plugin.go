package builder

import (
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/plugin/decl"
)

type plugin[P decl.Plugin, B decl.Builder[P]] struct {
	build B
}

func (p plugin[P, B]) Invoke(ctx ux.Context) error {
	panic("not implemented")
}

func Plugin[P decl.Plugin, B decl.Builder[P]](build B) decl.Plugin {
	return plugin[P, B]{build}
}
