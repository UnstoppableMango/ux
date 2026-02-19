package pkg

import (
	"github.com/charmbracelet/log"
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

	for name, pack := range conf.GetPackages() {
		log.Infof("Processing package: %s", name)
		vars := uxv1alpha1.Vars_builder{Work: &wd}
		if _, err := image.Generate(fsys, pack, vars.Build()); err != nil {
			return err
		}
	}

	log.Info("Done")
	return nil
}
