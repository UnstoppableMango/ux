package os

import "github.com/unmango/go/fp/functor"

type typ[T any] func(T)

type m[T any] struct {
	typ[T]
}

func Lift[A, B any]() {
	_ = functor.Lift[A, B](Map)
}

func Map[A, B any](os m[A], fn func(A) B) m[B] {
	return fn(os)
}
