package fs

import (
	"context"

	"github.com/spf13/afero"
)

type key struct{}

func FromContext(ctx context.Context) afero.Fs {
	if v := ctx.Value(key{}); v != nil {
		return v.(afero.Fs)
	} else {
		return afero.NewOsFs()
	}
}

func WithContext(parent context.Context, val afero.Fs) context.Context {
	return context.WithValue(parent, key{}, val)
}
