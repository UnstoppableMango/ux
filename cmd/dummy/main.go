package main

import (
	"context"
	"os"

	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/cli"
	"github.com/unstoppablemango/ux/pkg/plugin/handler"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
)

var Plugin = plugin.New("dummy", handler.NoOp,
	plugin.WithDialOptions(
		grpc.WithTransportCredentials(insecure.NewCredentials()),
	),
)

func main() {
	input, err := cli.Parse(os.Args[1:])
	if err != nil {
		cli.Fail(err)
	}

	ctx := context.Background()
	if err = Plugin.Acknowledge(ctx, input.Host); err != nil {
		cli.Fail(err)
	}
}
