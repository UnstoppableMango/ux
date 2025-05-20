package source

import (
	"context"
	"io"

	"github.com/unstoppablemango/ux/pkg/os"
)

type stdin func(context.Context) (io.Reader, error)

func (open stdin) Open(ctx context.Context) (io.Reader, error) {
	return open(ctx)
}

func OpenStdin(ctx context.Context) (io.Reader, error) {
	return os.FromContext(ctx).Stdin(), nil
}

var Stdin stdin = OpenStdin

type File string

func (f File) Open(ctx context.Context) (io.Reader, error) {
	return os.FromContext(ctx).Fs().Open(string(f))
}
