package local

import (
	"context"
	"errors"
	"io/fs"
	"maps"
	"path/filepath"

	"github.com/spf13/afero"
	"github.com/unmango/go/os"
	ux "github.com/unstoppablemango/ux/pkg"
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
	wd, err := os.System.Getwd()
	if err != nil {
		return nil, err
	}

	plugins := map[string]ux.LegacyPlugin{}
	err = afero.Walk(afero.NewOsFs(), d.Path(),
		func(path string, info fs.FileInfo, err error) error {
			switch {
			case errors.Is(err, fs.ErrNotExist):
				fallthrough
			case info.IsDir():
				return nil
			case err != nil:
				return err
			case !BinPattern.MatchString(info.Name()):
				return nil
			}

			if ext := filepath.Ext(path); ext != "" {
				return nil
			}

			if filepath.IsLocal(path) {
				path = filepath.Join(wd, path)
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
