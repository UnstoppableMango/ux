package image

import (
	"fmt"
	"io"

	"github.com/charmbracelet/log"
	v1 "github.com/google/go-containerregistry/pkg/v1"
	"github.com/google/go-containerregistry/pkg/v1/mutate"
	"github.com/spf13/afero"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/config"
	"github.com/unstoppablemango/ux/pkg/output"
)

type Package = uxv1alpha1.Package

func Write(fsys afero.Fs, pname string, img v1.Image) error {
	out, err := fsys.Create(pname + ".tar")
	if err != nil {
		return fmt.Errorf("creating file: %w", err)
	}
	defer out.Close()

	rc := mutate.Extract(img)
	defer rc.Close()

	if _, err = io.Copy(out, rc); err != nil {
		return fmt.Errorf("copying image: %w", err)
	}

	return nil
}

func Generate(fsys afero.Fs, pack *Package, vars *config.Vars) (v1.Image, error) {
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
