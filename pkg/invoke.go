package ux

import (
	"context"
	"io"

	"charm.land/log/v2"
	"github.com/unstoppablemango/ux/pkg/config"
)

func Invoke(ctx context.Context, config *Config) error {
	for name, generator := range config.GetGenerate() {
		log.Info("Generator", "name", name)
		for key, value := range generator.GetConfig() {
			log.Info("Config", "key", key, "value", value)
		}
	}
	return nil
}

func InvokeStdin(stdin io.Reader) error {
	cfg, err := config.ReadWith(stdin, config.JsonCodec)
	if err != nil {
		return err
	}
	return Invoke(context.Background(), cfg)
}
