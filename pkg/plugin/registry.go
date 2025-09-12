package plugin

import (
	"context"
)

type LegacyRegistry interface {
	List(context.Context) (List, error)
}
