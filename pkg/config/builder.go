package config

import (
	"fmt"

	"github.com/spf13/cobra"
	"github.com/spf13/viper"
)

type Builder interface {
	BindPersistentFlags(cmd *cobra.Command)
	Initialize()
}

type builder struct {
	viper   *viper.Viper
	cfgFile string
}

func NewBuilder() Builder {
	return &builder{}
}

func (b *builder) Initialize() {
	if b.cfgFile != "" {
		b.viper.SetConfigFile(b.cfgFile)
	} else {
		b.viper.AddConfigPath(DefaultDir)
		b.viper.SetConfigName(DefaultName)
		b.viper.SetConfigType(DefaultType)
	}
}

func (b *builder) BindPersistentFlags(cmd *cobra.Command) {
	cmd.PersistentFlags().StringVar(&b.cfgFile, "config", "",
		fmt.Sprintf("config file (default is %s)", DefaultPath),
	)
}
