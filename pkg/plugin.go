package ux

import (
	"context"
)

type Plugin interface {
	Invoke(context.Context, string) error
}
