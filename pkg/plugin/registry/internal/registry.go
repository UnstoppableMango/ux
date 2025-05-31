package internal

import (
	"sync"

	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/registry"
)

var reg = &Static{}

type Static struct {
	sync.Mutex
	r registry.Aggregate
}

func Default() plugin.Registry {
	return reg.r
}

func AddDefault(r ...plugin.Registry) {
	reg.Lock()
	reg.r = append(reg.r, r...)
	reg.Unlock()
}
