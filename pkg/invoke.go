package ux

import (
	"context"
	"fmt"
	"io"

	"charm.land/log/v2"
	"github.com/unstoppablemango/godec/proto"
	"github.com/unstoppablemango/ux/pkg/config"
)

var ErrNoDestination = fmt.Errorf("link has no destination")

func Invoke(ctx context.Context, config *Config) error {
	log.Infof("%v", config)
	return nil
}

func InvokeStdin(stdin io.Reader) error {
	cfg, err := config.ReadWith(stdin, proto.Json)
	if err != nil {
		return err
	}
	return Invoke(context.Background(), cfg)
}
