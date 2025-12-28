package config

import (
	"path/filepath"

	"github.com/adrg/xdg"
	"github.com/spf13/viper"
)

const (
	Project     = "ux"
	DefaultName = ".config"
	DefaultType = "yaml"
	DefaultFile = DefaultName + "." + DefaultType
)

var (
	DefaultDir  = filepath.Join(xdg.ConfigHome, Project)
	DefaultPath = filepath.Join(DefaultDir, DefaultFile)
	PluginDir   = filepath.Join(DefaultDir, "plugins")
	LocalBin    = xdg.BinHome
)

type Target struct {
	Type    string   `json:"type" yaml:"type"`
	Args    []string `json:"args" yaml:"args"`
	Command []string `json:"command" yaml:"command"`
	Outputs []string `json:"outputs" yaml:"outputs"`
}

type Config struct {
	Targets map[string]Target `json:"targets" yaml:"targets"`
}

func NewViper() *viper.Viper {
	v := viper.New()
	v.SetConfigName(DefaultName)
	v.AddConfigPath(DefaultDir)
	v.AddConfigPath(".")

	return v
}

func Read(v *viper.Viper) (*Config, error) {
	if v == nil {
		v = NewViper()
	}

	if err := v.ReadInConfig(); err != nil {
		return nil, err
	}

	var cfg Config
	if err := v.Unmarshal(&cfg); err != nil {
		return nil, err
	}

	return &cfg, nil
}
