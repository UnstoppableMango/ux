package plugin

import (
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/ux"
	"google.golang.org/grpc"
)

type Client interface {
	V1Alpha1() uxv1alpha1.PluginServiceClient
}

type client struct {
	conn grpc.ClientConnInterface
}

// V1Alpha1 implements Client.
func (c client) V1Alpha1() uxv1alpha1.PluginServiceClient {
	return uxv1alpha1.NewPluginServiceClient(c.conn)
}

func ClientFor(host ux.Host, opts ...grpc.DialOption) (Client, error) {
	if conn, err := host.Dial(opts...); err != nil {
		return nil, err
	} else {
		return client{conn}, nil
	}
}
