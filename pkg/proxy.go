package ux

import (
	"context"
)

type Proxy interface {
	Acknowledged(context.Context)
}
