package list

import (
	"github.com/unstoppablemango/ux/pkg/plugin"
)

type Options struct {
	DisableDefault bool
	Registries     []plugin.Registry
}

type Option func(*Options)
