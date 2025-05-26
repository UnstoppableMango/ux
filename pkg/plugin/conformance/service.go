package conformance

import (
	"context"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
)

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

// UxService is implemented as a manual mock instead of using gomock due to the embedded
// struct requirement. The generated mock methods do not satisfy that requirement and
// gomock does not appear to support specifying structs to be embedded.
type UxService struct {
	uxv1alpha1.UnimplementedUxServiceServer
	AcknowledgeEndpoint endpoint[*uxv1alpha1.AcknowledgeRequest, *uxv1alpha1.AcknowledgeResponse]
	CompleteEndpoint    endpoint[*uxv1alpha1.CompleteRequest, *uxv1alpha1.CompleteResponse]
}

func (s *UxService) Acknowledge(_ context.Context, req *uxv1alpha1.AcknowledgeRequest) (*uxv1alpha1.AcknowledgeResponse, error) {
	s.AcknowledgeEndpoint.Receive(req)
	return s.AcknowledgeEndpoint.NextResponse()
}

func (s *UxService) Complete(_ context.Context, req *uxv1alpha1.CompleteRequest) (*uxv1alpha1.CompleteResponse, error) {
	s.CompleteEndpoint.Receive(req)
	return s.CompleteEndpoint.NextResponse()
}
