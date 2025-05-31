package os

import (
	"context"
	"io"
	"os"

	"github.com/spf13/afero"
)

//go:generate go tool mockgen -destination zz_generated.mock.go -package os . Os

var System = sys{}

type Os interface {
	Fs() afero.Fs
	Getwd() (string, error)
	Stderr() io.Writer
	Stdin() io.Reader
	Stdout() io.Writer
}

type (
	key struct{}
	sys struct{}
)

func (sys) Fs() afero.Fs {
	return afero.NewOsFs()
}

func (sys) Getwd() (dir string, err error) {
	return os.Getwd()
}

func (sys) Stderr() io.Writer {
	return os.Stderr
}

func (sys) Stdin() io.Reader {
	return os.Stdin
}

func (sys) Stdout() io.Writer {
	return os.Stdout
}

func FromContext(ctx context.Context) Os {
	if v := ctx.Value(key{}); v != nil {
		return v.(Os)
	} else {
		return System
	}
}

func WithContext(parent context.Context, val Os) context.Context {
	return context.WithValue(parent, key{}, val)
}
