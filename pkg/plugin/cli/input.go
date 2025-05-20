package cli

import (
	"google.golang.org/grpc"
)

type (
	Host    string
	Command string
)

const (
	RegisterCommand Command = "register"
)

type Input struct {
	Host    Host
	Command Command
}

func (h Host) NewClient(opts ...grpc.DialOption) (Client, error) {
	if conn, err := grpc.NewClient(string(h), opts...); err != nil {
		return nil, err
	} else {
		return client{conn}, nil
	}
}
