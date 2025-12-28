package cmd

import (
	"github.com/spf13/pflag"
	"github.com/spf13/viper"
	"github.com/unstoppablemango/ux/pkg/config"
)

type GlobalOptions struct {
	Config  string
	Verbose bool
}

func (opts *GlobalOptions) NewConfig() *viper.Viper {
	viper := viper.New()
	if opts.Config != "" {
		viper.SetConfigFile(opts.Config)
	} else {
		viper.AddConfigPath(config.DefaultDir)
		viper.SetConfigName(config.DefaultName)
		viper.SetConfigType(config.DefaultType)
	}

	return viper
}

func (opts *GlobalOptions) ApplyFlags(flags *pflag.FlagSet) {
	ConfigVar(flags, &opts.Config)
	VerboseVar(flags, &opts.Verbose)
}
