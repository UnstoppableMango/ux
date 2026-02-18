package pkg

import (
	"fmt"

	"github.com/charmbracelet/log"
	v1 "github.com/google/go-containerregistry/pkg/v1"
	"github.com/spf13/afero"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/config"
	"github.com/unstoppablemango/ux/pkg/image"
)

func Execute(fsys afero.Fs, wd string) error {
	log.Infof("Working directory: %s", wd)
	file, err := config.Find(fsys, wd)
	if err != nil {
		return err
	}

	log.Infof("Using config file: %s", file)
	conf, err := config.Read(fsys, file)
	if err != nil {
		return err
	}

	vars := uxv1alpha1.Vars_builder{Work: &wd}
	packages := conf.GetPackages()
	images := make(map[string]v1.Image, len(packages))

	for name, pack := range conf.GetPackages() {
		log.Infof("Processing package: %s", name)
		if img, err := image.Generate(fsys, pack, vars.Build()); err != nil {
			return err
		} else {
			images[name] = img
		}
	}

	for name, img := range images {
		if err := image.Write(fsys, name, img); err != nil {
			return fmt.Errorf("writing image: %w", err)
		}
	}

	log.Info("Done")
	return nil
}
