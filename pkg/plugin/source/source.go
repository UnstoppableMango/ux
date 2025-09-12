package source

import (
	"context"
	"fmt"
	"io/fs"
	"path/filepath"

	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/plugin"
)

type LocalFile string

func (f LocalFile) String() string {
	return string(f)
}

func (f LocalFile) Load(context.Context) (ux.Plugin, error) {
	return nil, fmt.Errorf("not implemented")
}

func FromDirEntry(root string, entry fs.DirEntry) (plugin.Source, error) {
	if entry.IsDir() {
		return nil, fmt.Errorf("not a file: %s", entry.Name())
	}

	if !plugin.BinPattern.MatchString(entry.Name()) {
		return nil, fmt.Errorf("%s does not match pattern %s", entry.Name(), plugin.BinPattern)
	}

	return LocalFile(filepath.Join(root, entry.Name())), nil
}
