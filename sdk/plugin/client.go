package plugin

import (
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/sdk"
	"google.golang.org/grpc"
)

type Connection interface {
	V1Alpha1() uxv1alpha1.UxServiceClient
}

type connection struct {
	conn grpc.ClientConnInterface
}

// V1Alpha1 implements Client.
func (c connection) V1Alpha1() uxv1alpha1.UxServiceClient {
	return uxv1alpha1.NewUxServiceClient(c.conn)
}

func Dial(host sdk.Host, opts ...grpc.DialOption) (Connection, error) {
	if conn, err := host.Dial(opts...); err != nil {
		return nil, err
	} else {
		return connection{conn}, nil
	}
}
