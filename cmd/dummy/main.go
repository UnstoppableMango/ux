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

func main() {
	input, err := cli.Parse(os.Args[1:])
	if err != nil {
		cli.Fail(err)
	}

	client, err := input.Host.NewClient(
		grpc.WithTransportCredentials(insecure.NewCredentials()),
	)
	if err != nil {
		cli.Fail(err)
	}

	plugin := plugin.New("dummy", handler.NoOp,
		plugin.WithClient(client),
	)

	ctx := context.Background()
	if err = plugin.Invoke(ctx); err != nil {
		cli.Fail(err)
	}
}
