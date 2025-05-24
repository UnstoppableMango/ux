package plan

import (
	"github.com/unmango/go/iter"
	"github.com/unstoppablemango/ux/pkg/ux"
)

func Singleton(plugin ux.Plugin) ux.Plan {
	return ux.Plan(iter.Singleton(plugin))
}
