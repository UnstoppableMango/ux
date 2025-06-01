package config

import (
	"path/filepath"

	"github.com/adrg/xdg"
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

type Config interface{}
