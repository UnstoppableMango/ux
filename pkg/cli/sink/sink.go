package sink

import (
	"context"
	"io"

	"github.com/spf13/afero"
)

type File string

func (f File) Open(ctx context.Context) (io.Writer, error) {
	return afero.NewOsFs().Open(string(f))
}
