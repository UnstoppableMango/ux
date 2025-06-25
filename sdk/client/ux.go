package client

import (
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"google.golang.org/grpc"
)

func FromRequest(req *uxv1alpha1.GenerateRequest, opts ...grpc.DialOption) (uxv1alpha1.UxServiceClient, error) {
	if conn, err := grpc.NewClient(req.Address, opts...); err != nil {
		return nil, err
	} else {
		return uxv1alpha1.NewUxServiceClient(conn), nil
	}
}
