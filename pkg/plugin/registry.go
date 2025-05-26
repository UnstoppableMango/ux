package plugin

import (
	"context"
)

type Registry interface {
	List(context.Context) (List, error)
}
