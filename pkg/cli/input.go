package cli

import (
	"context"
	"io"
)

type Opener[T any] interface {
	Open(ctx context.Context) (T, error)
}

type Source interface {
	Opener[io.Reader]
}

type Sink interface {
	Opener[io.Writer]
}

type Input struct {
	Sources map[string]Source
	Sinks   map[string]Sink
}

func (i *Input) addSource(key string, source Source) {
	if i.Sources == nil {
		i.Sources = map[string]Source{}
	}

	i.Sources[key] = source
}

func (i *Input) addSink(key string, sink Sink) {
	if i.Sinks == nil {
		i.Sinks = map[string]Sink{}
	}

	i.Sinks[key] = sink
}
