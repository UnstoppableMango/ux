package internal

import (
	"io"
	"os"
	"strings"

	"github.com/unstoppablemango/ux/internal/version"
	"golang.org/x/mod/modfile"
)

var Version string = version.Development

func IsDevelopment() bool {
	switch Version {
	case "", version.Development:
		return true
	default:
		return false
	}
}

func ReadGoMod() (*modfile.File, error) {
	file, err := os.Open("go.mod")
	if err != nil {
		return nil, err
	}

	data, err := io.ReadAll(file)
	if err != nil {
		return nil, err
	}

	return modfile.Parse("go.mod", data, nil)
}

func GoToolVersion(file *modfile.File) (string, bool) {
	// Go tools are indirect dependencies in the modfile
	if r, found := GoModRequire(file); found && r.Indirect {
		return r.Mod.Version, true
	} else {
		return "", false
	}
}

func GoModRequire(file *modfile.File) (*modfile.Require, bool) {
	for _, r := range file.Require {
		if strings.HasPrefix(r.Mod.Path, "github.com/unstoppablemango/ux") {
			return r, true
		}
	}

	return nil, false
}

func RuntimeVersion() string {
	if IsDevelopment() {
		if mod, err := ReadGoMod(); err == nil {
			if version, found := GoToolVersion(mod); found {
				return version
			}
		}
	}

	return Version
}
