package plugin

import (
	"context"

	"github.com/unmango/go/iter"
	"github.com/unstoppablemango/ux/pkg/ux"
)

type List iter.Seq2[string, ux.Plugin]

var EmptyList = List(iter.Empty2[string, ux.Plugin]())

type Registry interface {
	List(context.Context) (iter.Seq2[string, ux.Plugin], error)
}
