package skel

import (
	"context"
	"io"
	"os"

	"github.com/unmango/go/cli"
	mangos "github.com/unmango/go/os"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"google.golang.org/protobuf/proto"
)

type CmdArgs struct {
	Args      []string
	StdinData []byte
}

type UxFuncs struct {
	Generate func(*CmdArgs) error
}

func (funcs UxFuncs) execute(ctx context.Context, mos mangos.Os) error {
	stdin, err := io.ReadAll(mos.Stdin())
	if err != nil {
		return err
	}

	args := &CmdArgs{
		Args:      os.Args,
		StdinData: stdin,
	}

	if funcs.Generate != nil {
		return funcs.Generate(args)
	} else {
		return nil
	}
}

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

func PluginMain(funcs UxFuncs) {
	ctx := context.Background()
	if err := funcs.execute(ctx, mangos.System); err != nil {
		cli.Fail(err)
	}
}
