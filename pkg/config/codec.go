package config

import (
	"fmt"
	"io"
	"io/fs"
	"path/filepath"

	"github.com/unmango/go/codec"
	"github.com/unstoppablemango/godec"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"
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

func Decode(r io.Reader, c codec.Any) (*uxv1alpha1.Config, error) {
	// var cfg Config
	var cfg uxv1alpha1.Config
	if err := c.NewDecoder(r).Decode(&cfg); err != nil {
		return nil, err
	}
	// return ToSpec(cfg), nil
	return &cfg, nil
}

func DecodeFile(file fs.File) (*uxv1alpha1.Config, error) {
	stat, err := file.Stat()
	if err != nil {
		return nil, err
	}
	c, err := CodecForFile(stat.Name())
	if err != nil {
		return nil, err
	}
	return Decode(file, c)
}

// func (c *GenerateConfig) UnmarshalJSON(data []byte) error {
// 	c.data = data
// 	return nil
// }

// func (c *GenerateConfig) UnmarshalYAML(data []byte) error {
// 	c.data = data
// 	return nil
// }
