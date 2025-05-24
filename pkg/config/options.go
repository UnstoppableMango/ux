package config

import (
	"github.com/spf13/pflag"
	"github.com/spf13/viper"
)

type GlobalOptions struct {
	Config string
}

func (opts *GlobalOptions) NewConfig() Config {
	config := viper.NewWithOptions()
	if opts.Config != "" {
		config.SetConfigFile(opts.Config)
	} else {
		config.AddConfigPath(DefaultDir)
		config.SetConfigName(DefaultName)
		config.SetConfigType(DefaultType)
	}

	return config
}

func (opts *GlobalOptions) ConfigVar(flags *pflag.FlagSet) {
	ConfigVar(flags, &opts.Config)
}
