package image

import (
	"fmt"
	"os"
	"path/filepath"

	"github.com/charmbracelet/log"
	"github.com/google/go-containerregistry/pkg/name"
	v1 "github.com/google/go-containerregistry/pkg/v1"
	"github.com/google/go-containerregistry/pkg/v1/tarball"
	"github.com/spf13/afero"
	"github.com/unstoppablemango/ux/pkg/config"
	"github.com/unstoppablemango/ux/pkg/output"
)

func Write(fsys afero.Fs, pname string, img v1.Image) error {
	wd, err := os.Getwd()
	if err != nil {
		return fmt.Errorf("getting working directory: %w", err)
	}

	out, err := fsys.Create(filepath.Join(wd, pname+".tar"))
	if err != nil {
		return fmt.Errorf("creating file: %w", err)
	}
	defer out.Close()

	store, err := name.NewRegistry("test")
	if err != nil {
		return fmt.Errorf("creating registry: %w", err)
	}

	tag := store.Repo(pname).Tag("test")
	if err = tarball.Write(tag, img, out); err != nil {
		return fmt.Errorf("writing tarball: %w", err)
	}

	return nil
}

func Generate(fsys afero.Fs, pack *config.Package, vars *config.Vars) (v1.Image, error) {
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
