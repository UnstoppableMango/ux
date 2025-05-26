package proxy

import (
	"context"
	"fmt"
	"time"
)

type mailbox[I, O any] struct {
	in  chan I
	out chan O
}

func (m mailbox[I, O]) receive(ctx context.Context, req I) (res O, err error) {
	m.in <- req

	ctx, cancel := context.WithTimeout(ctx, 1*time.Second)
	defer cancel()

	select {
	case <-ctx.Done():
		return res, fmt.Errorf("no response in time")
	case res = <-m.out:
		return res, nil
	}
}

func (m mailbox[I, O]) Wait() I {
	return <-m.in
}

func (m mailbox[I, O]) Send(msg O) {
	m.out <- msg
}
