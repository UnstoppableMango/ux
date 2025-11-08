package plugin

import (
	"bytes"
	"errors"
	"fmt"
	"os/exec"

	ux "github.com/unstoppablemango/ux/pkg"
)

type Cli struct {
	Name string
	Args []string
}

type CliError struct {
	cmd    *exec.Cmd
	stdout *bytes.Buffer
	stderr *bytes.Buffer
}

func (err CliError) Error() string {
	return fmt.Sprintf("%s\nstdout: %s\nstderr: %s",
		err.cmd,
		stringOrNil(err.stdout),
		stringOrNil(err.stderr),
	)
}

func (c Cli) Invoke(ctx ux.Context) error {
	cmd := exec.CommandContext(ctx.Context(),
		c.Name,
		c.Args...,
	)

	stdout, stderr := &bytes.Buffer{}, &bytes.Buffer{}
	cmd.Stdout, cmd.Stderr = stdout, stderr

	if err := cmd.Run(); err != nil {
		return errors.Join(err, CliError{cmd, stdout, stderr})
	}

	return nil
}

func stringOrNil(s fmt.Stringer) string {
	if v := s.String(); v == "" {
		return "<nil>"
	} else {
		return v
	}
}
