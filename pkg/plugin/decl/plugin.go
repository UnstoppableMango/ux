package decl

import (
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/plugin"
)

type Plugin interface {
	Invoke(ux.Context) error
}

type Builder[P Plugin] func(plugin.Ux) P
