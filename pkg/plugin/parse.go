package plugin

import (
	"fmt"
	"os/exec"
	"path/filepath"

	ux "github.com/unstoppablemango/ux/pkg"
)

func Parse(v string) (ux.Plugin, error) {
	if p, err := exec.LookPath(v); err == nil {
		return LocalBinary(p), nil
	}

	if filepath.IsAbs(v) {
		return LocalBinary(v), nil
	}

	return nil, fmt.Errorf("no plugin matching: %s", v)
}
