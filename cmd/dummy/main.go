package main

import (
	"context"
	"fmt"
	"os"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/plugin/cli"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
)

func main() {
	input, err := cli.Parse(os.Args[1:])
	if err != nil {
		cli.Fail(err)
	}

	fmt.Println("Parsed input: ", input)
	client, err := input.Host.NewClient(
		grpc.WithTransportCredentials(insecure.NewCredentials()),
	)
	if err != nil {
		cli.Fail(err)
	}

	ctx := context.Background()
	res, err := client.Plugin().Acknowledge(ctx, &uxv1alpha1.AcknowledgeRequest{
		Name: "dummy",
	})
	if err != nil {
		cli.Fail(err)
	}

	pat, err := client.Plugin().Complete(ctx, &uxv1alpha1.CompleteRequest{
		RequestId: res.RequestId,
	})

	fmt.Print(pat)
}
