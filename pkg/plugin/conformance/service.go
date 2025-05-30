package conformance

type stack[T any] []T

func (s stack[T]) Push(elem T) stack[T] {
	s = append(s, elem)
	return s
}

func (s stack[T]) Pop() (out stack[T], elem T, ok bool) {
	if ok = len(s) > 0; ok {
		elem, out = s[0], s[1:]
	}

	return out, elem, ok
}

type endpoint[T, U any] struct {
	Requests  stack[T]
	Responses stack[U]
}

func (e *endpoint[T, U]) Receive(req T) {
	e.Requests = e.Requests.Push(req)
}

func (e *endpoint[T, U]) Return(res U) {
	e.Responses = e.Responses.Push(res)
}

func (e *endpoint[T, U]) NextResponse() (res U, err error) {
	var ok bool
	if e.Responses, res, ok = e.Responses.Pop(); ok {
		return res, nil
	} else {
		return res, nil // TODO
	}
}
