package cli

import (
	"iter"
	"maps"

	"github.com/unstoppablemango/ux/pkg/ux"
)

type Input struct {
	Sources map[string]ux.Source
	Sinks   map[string]ux.Sink
}

func (i *Input) addSource(key string, source ux.Source) {
	if i.Sources == nil {
		i.Sources = map[string]ux.Source{}
	}

	i.Sources[key] = source
}

func (i *Input) addSink(key string, sink ux.Sink) {
	if i.Sinks == nil {
		i.Sinks = map[string]ux.Sink{}
	}

	i.Sinks[key] = sink
}

func (i Input) GetSources() iter.Seq2[string, ux.Source] {
	return maps.All(i.Sources)
}

func (i Input) GetSinks() iter.Seq2[string, ux.Sink] {
	return maps.All(i.Sinks)
}
