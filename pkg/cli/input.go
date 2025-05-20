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
