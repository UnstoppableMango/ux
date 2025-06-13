package source

import (
	"context"
	"io"
	"io/fs"
	"path/filepath"
	"time"

	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/os"
)

var Stdin ux.Source = stdin{}

type stdin struct{}

func (open stdin) Open(ctx context.Context) (io.Reader, error) {
	return OpenStdin(ctx)
}

func OpenStdin(ctx context.Context) (io.Reader, error) {
	return os.FromContext(ctx).Stdin(), nil
}

type File string

// IsDir implements fs.FileInfo.
func (f File) IsDir() bool { return false }

// ModTime implements fs.FileInfo.
func (f File) ModTime() time.Time {
	panic("unimplemented")
}

// Mode implements fs.FileInfo.
func (f File) Mode() fs.FileMode {
	panic("unimplemented")
}

// Name implements fs.FileInfo.
func (f File) Name() string {
	return filepath.Base(f.Path())
}

// Size implements fs.FileInfo.
func (f File) Size() int64 {
	panic("unimplemented")
}

// Sys implements fs.FileInfo.
func (f File) Sys() any { return f }

func (f File) Path() string {
	return string(f)
}

func (f File) Open(ctx context.Context) (io.Reader, error) {
	return os.FromContext(ctx).Fs().Open(f.Path())
}
