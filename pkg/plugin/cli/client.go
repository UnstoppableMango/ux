package cli

import (
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"google.golang.org/grpc"
)

type client struct {
	conn *grpc.ClientConn
}

// Plugin implements Client.
func (c client) Plugin() uxv1alpha1.PluginServiceClient {
	return uxv1alpha1.NewPluginServiceClient(c.conn)
}

// Ux implements Client.
func (c client) Ux() uxv1alpha1.UxServiceClient {
	return uxv1alpha1.NewUxServiceClient(c.conn)
}
