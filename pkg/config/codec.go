package config

import (
	"fmt"
	"io"
	"io/fs"
	"path/filepath"

	"github.com/unmango/go/codec"
	"github.com/unstoppablemango/godec"
	ux "github.com/unstoppablemango/ux/pkg"
)

func CodecForFile(name string) (codec.Any, error) {
	switch ext := filepath.Ext(name); ext {
	case ".yaml", ".yml":
		return godec.Yaml, nil
	case ".json":
		return godec.Json, nil
	default:
		return nil, fmt.Errorf("unsupported file extension: %s", ext)
	}
}

func Decode(c codec.Any, r io.Reader) (*ux.Config, error) {
	var cfg Config
	if err := c.NewDecoder(r).Decode(&cfg); err != nil {
		return nil, err
	}
	return ToSpec(cfg), nil
}

func DecodeFile(file fs.File) (*ux.Config, error) {
	stat, err := file.Stat()
	if err != nil {
		return nil, err
	}
	c, err := CodecForFile(stat.Name())
	if err != nil {
		return nil, err
	}
	return Decode(c, file)
}
