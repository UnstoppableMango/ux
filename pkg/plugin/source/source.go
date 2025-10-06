package source

import (
	"context"
	"fmt"
	"io"
	"io/fs"
	"os"
	"path/filepath"

	"github.com/spf13/afero"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/cli"
)

type Cli string

func (f Cli) String() string {
	return string(f)
}

func (f Cli) Load(context.Context) (ux.Plugin, error) {
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

type reader struct{ io.Reader }

func (r reader) Load(context.Context) (ux.Plugin, error) {
	tmp, err := os.MkdirTemp("", "")
	if err != nil {
		return nil, err
	}

	fs := afero.NewOsFs()
	if err := afero.WriteReader(fs, tmp, r); err != nil {
		return nil, err
	}

	afero.TempFile()
}
