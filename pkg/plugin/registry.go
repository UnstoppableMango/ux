package plugin

import (
	"context"
	"iter"
)

type Registry interface {
	List(context.Context) (iter.Seq2[string, Plugin], error)
}
