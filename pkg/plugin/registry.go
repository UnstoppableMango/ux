package plugin

import (
	"context"
	"iter"

	"github.com/unstoppablemango/ux/pkg/ux"
)

type Registry interface {
	List(context.Context) (iter.Seq2[string, ux.Plugin], error)
}
