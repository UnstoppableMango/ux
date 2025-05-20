package svc

import (
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"google.golang.org/grpc"
)

func Register(server *grpc.Server) {
	uxv1alpha1.RegisterPluginServiceServer(server, Plugin{})
	uxv1alpha1.RegisterUxServiceServer(server, Ux{})
}
