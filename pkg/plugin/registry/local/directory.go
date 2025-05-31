package local

import (
	"context"
	"io/fs"
	"maps"

	"github.com/spf13/afero"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/os"
	"github.com/unstoppablemango/ux/pkg/plugin"
)

type Directory string

func (d Directory) Path() string {
	return string(d)
}

func (d Directory) List(ctx context.Context) (plugin.List, error) {
	os := os.FromContext(ctx)
	plugins := map[string]ux.Plugin{}
	err := afero.Walk(afero.NewRegexpFs(os.Fs(), BinPattern), d.Path(),
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
