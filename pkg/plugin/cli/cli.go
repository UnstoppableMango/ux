package cli

import (
	"bytes"
	"context"
	"fmt"
	"os/exec"

	"github.com/charmbracelet/log"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	ux "github.com/unstoppablemango/ux/pkg"
	"google.golang.org/protobuf/proto"
)

type generator struct {
	source, target ux.Spec
	path           string
}

// Generate implements ux.Generator.
func (g generator) Generate(ctx context.Context, i ux.Input) error {
	log := log.FromContext(ctx).With("cmd", g.path)

	cmd := exec.CommandContext(ctx, g.path)
	stdin := &uxv1alpha1.Stdin{
		Command: uxv1alpha1.Command_COMMAND_GENERATE,
		Args:    []string{}, // TODO
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

func Generator(path string, source, target ux.Spec) ux.Generator {
	return generator{source, target, path}
}
