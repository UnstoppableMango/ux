package cli

import (
	"github.com/unmango/go/iter"
	ux "github.com/unstoppablemango/ux/pkg"
)

type Input struct {
	sources iter.Seq2[string, ux.Source]
	sinks   iter.Seq2[string, ux.Sink]
}

// Sources implements ux.Input.
func (i Input) Sources() iter.Seq2[string, ux.Source] {
	if i.sources == nil {
		return iter.Empty2[string, ux.Source]()
	} else {
		return i.sources
	}
}

// Sinks implements ux.Input.
func (i Input) Sinks() iter.Seq2[string, ux.Sink] {
	if i.sinks == nil {
		return iter.Empty2[string, ux.Sink]()
	} else {
		return i.sinks
	}
}
