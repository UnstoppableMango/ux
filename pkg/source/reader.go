package source

import (
	"context"
	"io"

	ux "github.com/unstoppablemango/ux/pkg"
)

func ReadAll(ctx context.Context, s ux.Source) ([]byte, error) {
	if r, err := s.Open(ctx); err != nil {
		return nil, err
	} else {
		return io.ReadAll(r)
	}
}
