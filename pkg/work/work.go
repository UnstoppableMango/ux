package work

import (
	"fmt"

	"github.com/spf13/afero"
	"github.com/unmango/go/os"
)

type Space interface {
	afero.Fs
}

type space struct {
	afero.Fs
}

func CwdOs(os os.Os) (Space, error) {
	if dir, err := os.Getwd(); err != nil {
		return nil, err
	} else {
		return DirFs(dir, afero.FromIOFS{FS: os})
	}
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
