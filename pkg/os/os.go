package os

import (
	"context"
	"io"
	"os"
)

type key struct{}

type Os interface {
	Stdin() io.Reader
}

type System struct{}

var sys System

func (System) Stdin() io.Reader {
	return os.Stdin
}

func FromContext(ctx context.Context) Os {
	if v := ctx.Value(key{}); v != nil {
		return v.(Os)
	} else {
		return sys
	}
}

func WithContext(parent context.Context, val Os) context.Context {
	return context.WithValue(parent, key{}, val)
}
