package ux

import "google.golang.org/grpc"

type Host string

func (h Host) NewClient(opts ...grpc.DialOption) (*grpc.ClientConn, error) {
	return grpc.NewClient(string(h), opts...)
}
