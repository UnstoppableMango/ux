package cli

import (
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"google.golang.org/grpc"
)

type (
	Host    string
	Command string
)

const (
	RegisterCommand Command = "register"
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

type Input struct {
	Host    Host
	Command Command
}

func (h Host) NewClient(opts ...grpc.DialOption) (plugin.Client, error) {
	if conn, err := grpc.NewClient(string(h), opts...); err != nil {
		return nil, err
	} else {
		return client{conn}, nil
	}
}
