package sink

import (
	"context"
	"io"

	"github.com/unstoppablemango/ux/pkg/os"
)

type File string

func (f File) Open(ctx context.Context) (io.Writer, error) {
	return os.FromContext(ctx).Fs().Open(string(f))
}
