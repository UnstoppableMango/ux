package os

import (
	"context"
	"io"
	"os"

	"github.com/spf13/afero"
	"github.com/unstoppablemango/ux/pkg/os/fs"
)

//go:generate go tool mockgen -destination zz_generated.mock.go -package os . Os

type Os interface {
	Fs() afero.Fs
	Stdin() io.Reader
}

type (
	key    struct{}
	System struct{ fs afero.Fs }
)

func (s System) Fs() afero.Fs {
	return s.fs
}

func (System) Stdin() io.Reader {
	return os.Stdin
}

func FromContext(ctx context.Context) Os {
	if v := ctx.Value(key{}); v != nil {
		return v.(Os)
	} else {
		return System{fs.FromContext(ctx)}
	}
}

func WithContext(parent context.Context, val Os) context.Context {
	return context.WithValue(parent, key{}, val)
}
