package skel

import (
	"context"
	"io"
	"os"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"google.golang.org/protobuf/proto"
)

type Cli struct {
	Generate func(context.Context, []string) error
}

func (p *Cli) Execute() error {
	return p.ExecuteContext(context.Background())
}

func (p *Cli) ExecuteContext(ctx context.Context) error {
	data, err := io.ReadAll(os.Stdin)
	if err != nil {
		return err
	}

	var stdin uxv1alpha1.Stdin
	if err := proto.Unmarshal(data, &stdin); err != nil {
		return err
	}

	switch stdin.Command {
	case uxv1alpha1.Command_COMMAND_GENERATE:
		return p.Generate(ctx, stdin.Args)
	default:
		return nil
	}
}
