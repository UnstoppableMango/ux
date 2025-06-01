package sink

import (
	"context"

	ux "github.com/unstoppablemango/ux/pkg"
)

func Write(ctx context.Context, sink ux.Sink, data []byte) (n int, err error) {
	if w, err := sink.Open(ctx); err != nil {
		return n, err
	} else {
		return w.Write(data)
	}
}
