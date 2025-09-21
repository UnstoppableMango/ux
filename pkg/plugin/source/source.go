package source

import (
	"context"
	"fmt"
	"io/fs"
	"path/filepath"

	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/cli"
)

type LocalFile string

func (f LocalFile) String() string {
	return string(f)
}

func (f LocalFile) Load(context.Context) (ux.Plugin, error) {
	return cli.Plugin(f), nil
}

func FromDirEntry(root string, entry fs.DirEntry) (plugin.Source, error) {
	if entry.IsDir() {
		return nil, fmt.Errorf("not a file: %s", entry.Name())
	} else {
		return Cli(root, entry.Name())
	}
}

// TODO: Rename this, way too confusing as-is

func Cli(root, name string) (plugin.Source, error) {
	if !plugin.BinPattern.MatchString(name) {
		return nil, fmt.Errorf("%s does not match pattern %s", name, plugin.BinPattern)
	}

	return LocalFile(filepath.Join(root, name)), nil
}
