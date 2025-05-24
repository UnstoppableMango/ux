package config

import (
	"path/filepath"

	"github.com/adrg/xdg"
	"github.com/spf13/viper"
)

const (
	Project     = "ux"
	DefaultName = "." + Project
	DefaultType = "yaml"
)

var (
	Reload = xdg.Reload

	DefaultDir  = filepath.Join(xdg.ConfigHome, Project)
	DefaultFile = DefaultName + DefaultType
	DefaultPath = filepath.Join(DefaultDir, DefaultFile)
)

type Config interface{}

type config struct {
	*viper.Viper

	File string
}

func New() Config {
	return &config{
		Viper: viper.New(),
	}
}
