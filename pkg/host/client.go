package host

import (
	"github.com/unstoppablemango/ux/pkg/ux"
	"google.golang.org/grpc"
)

func NewClient(host ux.Host, opts ...grpc.DialOption) (*grpc.ClientConn, error) {
	return host.Dial(opts...)
}
