package local

import (
	"context"
	"io/fs"
	"maps"
	"path/filepath"
	"sync"

	"github.com/spf13/afero"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/os"
	"github.com/unstoppablemango/ux/pkg/plugin"
)

var Cwd = Directory(".")

type Directory string

func (d Directory) Path() string {
	return string(d)
}

func (d Directory) Join(path string) Directory {
	return Directory(filepath.Join(d.Path(), path))
}

func (d Directory) List(ctx context.Context) (plugin.List, error) {
	os := os.FromContext(ctx)
	getwd := sync.OnceValues(func() (string, error) {
		return os.Getwd()
	})

	plugins := map[string]ux.Plugin{}
	err := afero.Walk(afero.NewRegexpFs(os.Fs(), BinPattern), d.Path(),
		func(path string, info fs.FileInfo, err error) error {
			if err != nil {
				return err
			}
			if info.IsDir() {
				return nil
			}

			if filepath.IsLocal(path) {
				if wd, err := getwd(); err != nil {
					return err
				} else {
					path = filepath.Join(wd, path)
				}
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
