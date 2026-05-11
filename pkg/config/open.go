package config

import (
	"fmt"
	"io/fs"
	"os"
	"path/filepath"

	"charm.land/log/v2"
	"github.com/unmango/go/codec"
	"github.com/unstoppablemango/godec"
	ux "github.com/unstoppablemango/ux/pkg"
)

var FileGlob = "ux.*"

func OpenFirst(root *os.Root) (*ux.Config, error) {
	f, err := OpenFirstFile(root)
	if err != nil {
		return nil, err
	}
	defer f.Close()

	stat, err := f.Stat()
	if err != nil {
		return nil, err
	}

	var m codec.Any
	switch filepath.Ext(stat.Name()) {
	case ".yaml", ".yml":
		m = godec.Yaml
	case ".json":
		m = godec.Json
	}

	var cfg Config
	if err = m.NewDecoder(f).Decode(&cfg); err != nil {
		return nil, err
	}
	return ToSpec(cfg), nil
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
