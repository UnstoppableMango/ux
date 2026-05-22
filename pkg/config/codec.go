package config

import (
	"fmt"
	"io"
	"io/fs"
	"path/filepath"

	"github.com/goccy/go-yaml"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"
	"google.golang.org/protobuf/encoding/protojson"
)

func DecodeFile(file fs.File, cfg *uxv1alpha1.Config) error {
	stat, err := file.Stat()
	if err != nil {
		return err
	}

	switch ext := filepath.Ext(stat.Name()); ext {
	case ".yaml", ".yml":
		return DecodeYAML(file, cfg)
	case ".json":
		return DecodeJSON(file, cfg)
	default:
		return fmt.Errorf("unsupported extension: %s", ext)
	}
}

func DecodeJSON(r io.Reader, cfg *uxv1alpha1.Config) error {
	data, err := io.ReadAll(r)
	if err != nil {
		return err
	}
	return UnmarshalJSON(data, cfg)
}

func DecodeYAML(r io.Reader, cfg *uxv1alpha1.Config) error {
	data, err := io.ReadAll(r)
	if err != nil {
		return err
	}
	return UnmarshalYAML(data, cfg)
}

func ReadFile(file fs.File) (*uxv1alpha1.Config, error) {
	var cfg uxv1alpha1.Config
	if err := DecodeFile(file, &cfg); err != nil {
		return nil, err
	}
	return &cfg, nil
}

func ReadJSON(r io.Reader) (*uxv1alpha1.Config, error) {
	var cfg uxv1alpha1.Config
	if err := DecodeJSON(r, &cfg); err != nil {
		return nil, err
	}
	return &cfg, nil
}

func ReadYAML(r io.Reader) (*uxv1alpha1.Config, error) {
	var cfg uxv1alpha1.Config
	if err := DecodeYAML(r, &cfg); err != nil {
		return nil, err
	}
	return &cfg, nil
}

func UnmarshalJSON(data []byte, cfg *uxv1alpha1.Config) error {
	return protojson.Unmarshal(data, cfg)
}

func UnmarshalYAML(data []byte, cfg *uxv1alpha1.Config) error {
	json, err := yaml.YAMLToJSON(data)
	if err != nil {
		return err
	}
	return UnmarshalJSON(json, cfg)
}
