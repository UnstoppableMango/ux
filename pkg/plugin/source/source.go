package source

import (
	"context"
	"fmt"
	"io/fs"
	"os"
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

type dirEntry struct {
	fs.DirEntry
	root string
}

func (e dirEntry) String() string {
	return e.Path()
}

func (e dirEntry) Load(context.Context) (ux.Plugin, error) {
	if e.IsDir() {
		return nil, fmt.Errorf("not a file: %s", e.Name())
	}
	if !plugin.BinPattern.MatchString(e.Name()) {
		return nil, fmt.Errorf("%s does not match %s", e.Name(), plugin.BinPattern)
	}

	return cli.Plugin(e.Path()), nil
}

func (e dirEntry) Path() string {
	return filepath.Join(e.root, e.Name())
}

func DirEntry(root string, entry fs.DirEntry) plugin.Source {
	return dirEntry{entry, root}
}

type envVar struct {
	plugin.Parser
	name string
}

func (e envVar) Load(context.Context) (ux.Plugin, error) {
	if env, ok := os.LookupEnv(e.name); !ok {
		return nil, fmt.Errorf("%s not set", e.name)
	} else {
		return e.Parse(env)
	}
}

func EnvVar(name string, parser plugin.Parser) plugin.Source {
	return envVar{parser, name}
}
