package pkg

import (
	"github.com/charmbracelet/log"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/image"
	"github.com/unstoppablemango/ux/pkg/work"
)

func Execute(ws *work.Workspace) error {
	conf, err := ws.Config()
	if err != nil {
		return err
	}

	for name, pack := range conf.GetPackages() {
		log.Infof("Processing package: %s", name)
		vars := uxv1alpha1.Vars_builder{}
		if _, err := image.Generate(fsys, pack, vars.Build()); err != nil {
			return err
		}
	}

	log.Info("Done")
	return nil
}
