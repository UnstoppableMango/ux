package cli

import (
	"context"
	"io"

	"github.com/unmango/go/cli"
	"github.com/unmango/go/option"
	"github.com/unmango/go/os"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	ux "github.com/unstoppablemango/ux/pkg"
	"google.golang.org/protobuf/proto"
)

var Fail = cli.Fail

type Option func(*Cli)

type Cli struct {
	plugin ux.LegacyPlugin
}

func New(plugin ux.LegacyPlugin, options ...Option) *Cli {
	cli := &Cli{plugin: plugin}
	option.ApplyAll(cli, options)
	return cli
}

func (c *Cli) Capabilities(ctx context.Context) error {
	return invoke(ctx, c.plugin.Capabilities, &uxv1alpha1.CapabilitiesRequest{})
}

func (c *Cli) Generate(ctx context.Context) error {
	return invoke(ctx, c.plugin.Generate, &uxv1alpha1.GenerateRequest{})
}

func invoke[T, V proto.Message](ctx context.Context, f func(context.Context, T) (V, error), req T) error {
	os := os.FromContext(ctx)
	data, err := io.ReadAll(os.Stdin())
	if err != nil {
		return err
	}

	if err = proto.Unmarshal(data, req); err != nil {
		return err
	}

	res, err := f(ctx, req)
	if err != nil {
		return err
	}

	data, err = proto.Marshal(res)
	if err != nil {
		return err
	}

	if _, err = os.Stdout().Write(data); err != nil {
		return err
	}

	return nil
}
