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
	Default     = viper.NewWithOptions()
)

type Config interface{}
