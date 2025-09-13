package main

import (
	"context"
	"fmt"

	"github.com/unstoppablemango/ux/pkg/cli"
	"github.com/unstoppablemango/ux/pkg/plugin/skel"
)

func main() {
	app := skel.Cli{
		Generate: func(ctx context.Context, s []string) error {
			fmt.Println("executed with: ", s)
			return nil
		},
	}

	if err := app.Execute(); err != nil {
		cli.Fail(err)
	}
}
