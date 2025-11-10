package cli

import (
	"bytes"
	"context"
	"fmt"
	"os/exec"

	"github.com/unmango/go/os"
	"github.com/unstoppablemango/ux/pkg/cli"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/decl"
)

var (
	Fail = cli.Fail
)

type Ux struct{ os.Os }

func (ux *Ux) InputFile() string {
	return ux.Getenv("UX_INPUT_FILE")
}

func (ux *Ux) OutputPath() string {
	return ux.Getenv("UX_OUTPUT_PATH")
}

func (ux *Ux) Context() context.Context {
	return context.Background()
}

func PluginMain(build func(plugin.Ux) decl.Plugin) {
	ux := &Ux{os.System}
	p := build(ux)

	if err := p.Invoke(ux); err != nil {
		panic(err)
	}
}

func Invoke(ctx context.Context, p plugin.String, input, output string) error {
	os := os.FromContext(ctx)
	dir, err := os.MkdirTemp("", "")
	if err != nil {
		return err
	}

	stdout, stderr := &bytes.Buffer{}, &bytes.Buffer{}

	cmd := exec.CommandContext(ctx, p.String())
	cmd.Stdout, cmd.Stderr = stdout, stderr
	cmd.Dir = dir
	cmd.Env = []string{
		fmt.Sprintf("UX_INPUT_FILE=%s", input),
		fmt.Sprintf("UX_OUTPUT_PATH=%s", output),
	}

	err = cmd.Run()

	if stdout.Len() > 0 {
		fmt.Println(stdout)
	}
	if stderr.Len() > 0 {
		fmt.Println(stderr)
	}

	return err
}
