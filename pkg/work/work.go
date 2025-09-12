package work

import (
	"context"
	"fmt"
	"io/fs"
	"os"

	"github.com/charmbracelet/log"
	"github.com/unmango/go/iter"

	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/plugin/registry"
)

type workspace struct {
	path string
	info fs.FileInfo
}

// Plugins implements ux.Workspace.
func (w workspace) Plugins() iter.Seq[ux.Plugin] {
	ctx := context.Background()
	return func(yield func(ux.Plugin) bool) {
		for s := range registry.Default.List() {
			if p, err := s.Load(ctx); err != nil {
				log.Debug("Failed to load plugin", "err", err)
			} else if !yield(p) {
				return
			}
		}
	}
}

func Cwd() (ux.Workspace, error) {
	if wd, err := os.Getwd(); err != nil {
		return nil, err
	} else {
		return Dir(wd)
	}
}

func Dir(path string) (ux.Workspace, error) {
	if info, err := os.Stat(path); err != nil {
		return nil, fmt.Errorf("dir workspace: %w", err)
	} else if info.IsDir() {
		return workspace{path, info}, nil
	} else {
		return nil, fmt.Errorf("no workspace at %s", path)
	}
}
