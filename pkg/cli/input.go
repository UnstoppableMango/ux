package cli

import (
	"context"
	"io"
)

type Source interface {
	Open(ctx context.Context) (io.Reader, error)
}

type Sink interface {
	Open(ctx context.Context) (io.Writer, error)
}

type Input struct {
	Sources map[string]Source
	Sinks   map[string]Sink
}
