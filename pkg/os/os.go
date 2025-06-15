package os

import (
	"context"
	"io"
	"os"

	"github.com/spf13/afero"
)

//go:generate go tool mockgen -destination zz_generated.mock.go -package os . Os

const (
	O_RDONLY = os.O_RDONLY
	O_WRONLY = os.O_WRONLY
	O_RDWR   = os.O_RDWR
	O_APPEND = os.O_APPEND
	O_CREATE = os.O_CREATE
	O_EXCL   = os.O_EXCL
	O_SYNC   = os.O_SYNC
	O_TRUNC  = os.O_TRUNC
)

var System = sys{}

type (
	FileInfo = os.FileInfo
	FileMode = os.FileMode
)

type Os interface {
	Fs() afero.Fs
	Getwd() (string, error)
	Stderr() io.Writer
	Stdin() io.Reader
	Stdout() io.Writer
	TempDir() string
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

func (sys) TempDir() string {
	return os.TempDir()
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
