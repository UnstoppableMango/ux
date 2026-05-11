package work

import (
	"github.com/spf13/afero"
	"github.com/unmango/go/fopt"
	"github.com/unstoppablemango/ux/pkg/config"
	"oras.land/oras-go/v2/content/oci"
)

type Workspace struct {
	fs afero.Fs
}

func New(options ...Option) *Workspace {
	w := &Workspace{fs: afero.NewOsFs()}
	fopt.ApplyAll(w, options)
	return w
}

func (w *Workspace) Config() (*config.Config, error) {
	if p, err := config.Find(w.fs); err != nil {
		return nil, err
	} else {
		return config.Read(w.fs, p)
	}
}

func (w *Workspace) Store() (*oci.Store, error) {

}

func (w *Workspace) Temp() (*Workspace, error) {
	if tmp, err := afero.TempDir(w.fs, "", "ux-"); err != nil {
		return nil, err
	} else {
		return &Workspace{fs: afero.NewBasePathFs(w.fs, tmp)}, nil
	}
}
