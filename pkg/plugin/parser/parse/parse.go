package parse

import (
	"fmt"
	"os"
	"path/filepath"

	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/cli"
)

func ExistingFile(v string) (ux.Plugin, error) {
	if stat, err := os.Stat(v); err != nil {
		return nil, err
	} else if stat.IsDir() {
		return nil, fmt.Errorf("not a file: %s", v)
	} else {
		return cli.Plugin(v), nil
	}
}

func LocalFile(v string) (ux.Plugin, error) {
	if plugin.BinPattern.MatchString(v) {
		return ExistingFile(v)
	} else {
		return nil, fmt.Errorf("%s did not satisfy %s", v, plugin.BinPattern)
	}
}

func LocalFileName(v string) (ux.Plugin, error) {
	return LocalFile(filepath.Base(v))
}

func NoOp(string) (ux.Plugin, error) {
	return nil, nil
}
