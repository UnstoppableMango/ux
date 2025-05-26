package plugin

import "context"

type LocalBinary string

// Invoke implements ux.Plugin.
func (l LocalBinary) Invoke(context.Context, string) error {
	panic("unimplemented")
}
