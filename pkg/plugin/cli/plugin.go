package cli

import (
	"context"

	"github.com/unstoppablemango/ux/pkg/ux"
)

type Plugin struct {
	Path string
}

func New(path string) ux.Plugin {
	return &Plugin{Path: path}
}

// Acknowledge implements ux.Plugin.
func (p *Plugin) Acknowledge(context.Context, ux.Host) error {
	panic("unimplemented")
}
