package cli

import (
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/decl"
)

type Context interface {
	Args() []string
}

func New(build func(Context) plugin.Cli) decl.Plugin {
	return decl.PluginFunc(func(ux decl.Ux) error {
		return build(ux).Invoke(ux)
	})
}
