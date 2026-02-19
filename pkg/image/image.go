package image

import (
	"fmt"

	"github.com/charmbracelet/log"
	"github.com/spf13/afero"
	"github.com/unstoppablemango/ux/pkg/config"
	"github.com/unstoppablemango/ux/pkg/output"
	"oras.land/oras-go/v2"
)

func Generate(fsys afero.Fs, pack *config.Package, vars *config.Vars) (oras.ReadOnlyTarget, error) {
	log.Infof("Config: %+v\n", pack)
	cmd, err := config.Command(pack.GetCommand(), vars)
	if err != nil {
		return nil, fmt.Errorf("building command: %w", err)
	}

	log.Infof("Executing command: %s", cmd.String())
	if err := cmd.Run(); err != nil {
		return nil, fmt.Errorf("executing command: %w", err)
	}

	img, err := output.Collect(fsys, pack.GetOutputs())
	if err != nil {
		return nil, fmt.Errorf("collecting output: %w", err)
	}

	return img, nil
}
