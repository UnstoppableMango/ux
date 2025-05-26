package registry

import (
	"context"
	"errors"
	"io/fs"

	"github.com/unmango/go/iter"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/ux"
)

type ErrorFilter struct {
	Filter   func(error) bool
	Registry plugin.Registry
}

func (r ErrorFilter) List(ctx context.Context) (iter.Seq2[string, ux.Plugin], error) {
	if plugins, err := r.Registry.List(ctx); r.Filter(err) {
		return iter.Empty2[string, ux.Plugin](), nil
	} else {
		return plugins, err
	}
}

func FilterErrors(registry plugin.Registry, filter func(error) bool) plugin.Registry {
	return ErrorFilter{Registry: registry, Filter: filter}
}

func IgnoreNotFound(registry plugin.Registry) plugin.Registry {
	return FilterErrors(registry, IsNotFound)
}

func IsNotFound(err error) bool {
	return errors.Is(err, fs.ErrNotExist)
}
