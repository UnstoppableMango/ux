package decl

type Builder[T any, U Plugin] func(T) U
