package plugin

import "github.com/spf13/afero"

type FsInjector interface {
	InjectFs(afero.Fs)
}

type WithFs struct {
	Fs afero.Fs
}

func (target *WithFs) InjectFs(fs afero.Fs) {
	target.Fs = fs
}
