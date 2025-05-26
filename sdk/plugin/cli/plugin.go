package cli

import (
	"context"

	"github.com/unstoppablemango/ux/pkg/ux"
	"github.com/unstoppablemango/ux/sdk"
)

type Plugin struct {
	Path string
}

func New(path string) ux.Plugin {
	return &Plugin{Path: path}
}

// Acknowledge implements ux.Plugin.
func (p *Plugin) Acknowledge(context.Context, sdk.Host) error {
	panic("unimplemented")
}
