package cli

import (
	"bytes"
	"context"
	"fmt"
	"os/exec"
	"path/filepath"

	"github.com/charmbracelet/log"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	ux "github.com/unstoppablemango/ux/pkg"
	"google.golang.org/protobuf/proto"
)

type generator struct {
	source, target ux.Spec
	path           string
}

func (g generator) String() string {
	return fmt.Sprintf("%#v", g)
}

// Generate implements ux.Generator.
func (g generator) Generate(ctx context.Context, i ux.Input) error {
	return execute(ctx, g.path, []string{})
}

func Generator(path string, source, target ux.Spec) ux.Generator {
	return generator{source, target, path}
}

type Plugin string

func (p Plugin) String() string {
	return string(p)
}

func (p Plugin) Path() string {
	return p.String()
}

func (p Plugin) BinName() string {
	return filepath.Base(p.String())
}

func (p Plugin) Execute(args []string) error {
	return execute(context.Background(), p.Path(), args)
}

func (p Plugin) Generator(source, target ux.Spec) (ux.Generator, error) {
	if BinName(source, target) == p.BinName() {
		return Generator(p.String(), source, target), nil
	} else {
		return nil, fmt.Errorf("unsupported: %s -> %s", source, target)
	}
}

func BinName(source, target ux.Spec) string {
	return fmt.Sprintf("%s2%s", source, target)
}

func execute(ctx context.Context, path string, args []string) error {
	log := log.FromContext(ctx).With("cmd", path)

	cmd := exec.CommandContext(ctx, path)
	stdin := &uxv1alpha1.Stdin{
		Command: uxv1alpha1.Command_COMMAND_GENERATE,
		Args:    args,
	}

	if data, err := proto.Marshal(stdin); err != nil {
		return fmt.Errorf("mashaling input message: %w", err)
	} else {
		cmd.Stdin = bytes.NewBuffer(data)
	}

	stderr, stdout := &bytes.Buffer{}, &bytes.Buffer{}
	cmd.Stderr = stderr
	cmd.Stdout = stdout

	if err := cmd.Run(); err != nil {
		log.Error("CLI failed", "err", err, "stdout", stdout, "stderr", stderr)
		return fmt.Errorf("executing cli: %w", err)
	}

	if stdout.Len() > 0 {
		log.Infof("stdout: %s", stdout)
	}
	if stderr.Len() > 0 {
		log.Infof("stderr: %s", stderr)
	}

	return nil
}
