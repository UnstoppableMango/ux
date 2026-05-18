package config

import (
	"fmt"
	"io/fs"
	"os"

	"charm.land/log/v2"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"
)

var FileGlob = "ux.*"

func OpenFirstRoot(name string) (*uxv1alpha1.Config, error) {
	root, err := os.OpenRoot(name)
	if err != nil {
		return nil, err
	}
	return OpenFirst(root)
}

func OpenFirst(root *os.Root) (*uxv1alpha1.Config, error) {
	f, err := OpenFirstFile(root)
	if err != nil {
		return nil, err
	}
	defer f.Close()
	return ReadFile(f)
}

func OpenFirstFile(root *os.Root) (fs.File, error) {
	matches, err := fs.Glob(root.FS(), FileGlob)
	if err != nil {
		return nil, err
	}
	if len(matches) <= 0 {
		return nil, fmt.Errorf("not found: %s", FileGlob)
	}
	log.Debug("Matched config", "matches", matches)
	return root.Open(matches[0])
}
