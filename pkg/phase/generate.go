package phase

import (
	"os/exec"

	"github.com/spf13/afero"
	ux "github.com/unstoppablemango/ux/pkg"
)

type Generate struct {
	cmd *exec.Cmd
}

func (g *Generate) String() string {
	return "generate"
}

func (g *Generate) Run(ctx ux.Context) error {
	dir, err := afero.ReadDir(ctx.Input(), "")
	if err != nil {
		return err
	}

	for _, fi := range dir {
	}

	return g.cmd.Run()
}

func NewGenerate(cmd *exec.Cmd) *Generate {
	return &Generate{cmd}
}
