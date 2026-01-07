package work

import (
	"fmt"

	"github.com/spf13/afero"
)

type Space interface {
	afero.Fs
}

type space struct {
	afero.Fs
}

func DirFs(dir string, fs afero.Fs) (Space, error) {
	if info, err := fs.Stat(dir); err != nil {
		return nil, fmt.Errorf("opening workspace: %w", err)
	} else if !info.IsDir() {
		return nil, fmt.Errorf("workspace is not a directory")
	}

	return &space{Fs: afero.NewBasePathFs(fs, dir)}, nil
}

func Dir(dir string) (Space, error) {
	return DirFs(dir, afero.NewOsFs())
}
