package config

import (
	"fmt"
	"io"
	"io/fs"
	"path/filepath"

	"github.com/unmango/go/codec"
	"github.com/unstoppablemango/godec/proto"
	"github.com/unstoppablemango/godec/yaml"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"
)

func CodecForFile(name string) (codec.Any, error) {
	return CodecForExt(filepath.Ext(name))
}

func CodecForExt(ext string) (codec.Any, error) {
	switch ext {
	case ".yaml", ".yml":
		return yaml.Goccy, nil
	case ".json":
		return proto.Json, nil
	default:
		return nil, fmt.Errorf("unsupported file extension: %s", ext)
	}
}

func ReadWith(r io.Reader, c codec.Any) (*uxv1alpha1.Config, error) {
	var cfg uxv1alpha1.Config
	if err := c.NewDecoder(r).Decode(&cfg); err != nil {
		return nil, err
	}
	return &cfg, nil
}

func ReadFile(file fs.File) (*uxv1alpha1.Config, error) {
	stat, err := file.Stat()
	if err != nil {
		return nil, err
	}
	c, err := CodecForFile(stat.Name())
	if err != nil {
		return nil, err
	}
	return ReadWith(file, c)
}
