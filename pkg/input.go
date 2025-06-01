package ux

import (
	"context"
	"io"
	"iter"
)

type Opener[T any] interface {
	Open(ctx context.Context) (T, error)
}

type (
	Source Opener[io.Reader]
	Sink   Opener[io.Writer]
)

type Input interface {
	Sources() iter.Seq2[string, Source]
	Sinks() iter.Seq2[string, Sink]
}
