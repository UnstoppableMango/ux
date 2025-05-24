package registry

import (
	"context"
	"io/fs"
	"iter"
	"maps"
	"regexp"

	"github.com/spf13/afero"
	"github.com/unstoppablemango/ux/pkg/plugin/cli"
	"github.com/unstoppablemango/ux/pkg/ux"
)

var BinPattern = regexp.MustCompile(`(.+2.+)|(ux-.+)`)

type LocalDirectory struct {
	Fs   afero.Fs
	Path string
}

func (r LocalDirectory) List(context.Context) (iter.Seq2[string, ux.Plugin], error) {
	if r.Fs == nil {
		r.Fs = afero.NewOsFs()
	}

	plugins := map[string]ux.Plugin{}
	err := afero.Walk(afero.NewRegexpFs(r.Fs, BinPattern), r.Path,
		func(path string, info fs.FileInfo, err error) error {
			if err != nil {
				return err
			}

			plugins[info.Name()] = cli.New(path)
			return nil
		},
	)
	if err != nil {
		return nil, err
	} else {
		return maps.All(plugins), nil
	}
}
