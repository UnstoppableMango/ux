package work

import "github.com/spf13/afero"

type Option func(*Workspace)

func WithFS(fs afero.Fs) Option {
	return func(w *Workspace) {
		w.fs = fs
	}
}

func WithWorkDir(dir string) Option {
	return func(w *Workspace) {
		w.fs = afero.NewBasePathFs(w.fs, dir)
	}
}
