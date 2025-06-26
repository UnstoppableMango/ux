package fs

import (
	"context"

	"github.com/spf13/afero"
)

var osfs = afero.NewOsFs()

type key struct{}

func FromContext(ctx context.Context) afero.Fs {
	if v := ctx.Value(key{}); v == nil {
		return osfs
	} else {
		return v.(afero.Fs)
	}
}

func WithContext(parent context.Context, fs afero.Fs) context.Context {
	return context.WithValue(parent, key{}, fs)
}
