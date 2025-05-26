package registry

import (
	"context"
	"io/fs"
	"maps"
	"regexp"

	"github.com/spf13/afero"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/config"
	"github.com/unstoppablemango/ux/pkg/plugin"
)

var BinPattern = regexp.MustCompile(`(.+2.+)|(ux-.+)`)

var UserConfig = IgnoreNotFound(LocalDirectory{
	Path: config.PluginDir,
})

type LocalDirectory struct {
	Fs   afero.Fs
	Path string
}

func (r LocalDirectory) List(context.Context) (plugin.List, error) {
	if r.Fs == nil {
		r.Fs = afero.NewOsFs()
	}

	plugins := map[string]ux.Plugin{}
	err := afero.Walk(afero.NewRegexpFs(r.Fs, BinPattern), r.Path,
		func(path string, info fs.FileInfo, err error) error {
			if err != nil {
				return err
			}

			plugins[info.Name()] = plugin.LocalBinary(path)
			return nil
		},
	)
	if err != nil {
		return nil, err
	} else {
		return maps.All(plugins), nil
	}
}
