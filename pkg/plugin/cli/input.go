package cli

import (
	"github.com/unstoppablemango/ux/pkg/plugin"
	"google.golang.org/grpc"
)

type (
	Host string
)

func (h Host) NewClient(opts ...grpc.DialOption) (plugin.Client, error) {
	if conn, err := grpc.NewClient(string(h), opts...); err != nil {
		return nil, err
	} else {
		return client{conn}, nil
	}
}

type Input struct {
	Host Host
}
