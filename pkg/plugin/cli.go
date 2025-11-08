package plugin

import (
	"os/exec"

	"github.com/unstoppablemango/ux/pkg/plugin/decl"
)

type Cli struct {
	Name string
	Args func(decl.Ux) []string
}

func (c Cli) Invoke(ctx decl.Ux) error {
	cmd := exec.CommandContext(ctx.Context(), c.Name,
		c.Args(ctx)...,
	)
	if err := cmd.Run(); err != nil {
		return err
	}

	return nil
}
