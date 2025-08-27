package config

import (
	"context"
	"fmt"
	"io"
	"path/filepath"

	"github.com/adrg/xdg"
	"github.com/google/uuid"
	ux "github.com/unstoppablemango/ux/pkg"
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

type Builder struct {
	inputs map[uuid.UUID]ux.Input
}

func (b *Builder) Add(input ux.Input) uuid.UUID {
	id := uuid.New()
	b.inputs[id] = input
	return id
}

type Context struct {
	b *Builder
}

// Context implements ux.Context.
func (c *Context) Context() context.Context {
	return context.TODO()
}

// Input implements ux.Context.
func (c *Context) Input(id uuid.UUID) (io.Reader, error) {
	i, ok := c.b.inputs[id]
	if !ok {
		return nil, fmt.Errorf("no input for id: %s", id)
	}

	panic("unimplemented")
}

// Output implements ux.Context.
func (c *Context) Output() (io.Writer, error) {
	panic("unimplemented")
}

func Execute(g ux.Generator, args []string) error {
	builder := &Builder{}
	if err := g.Configure(builder); err != nil {
		return err
	}

	ctx := &Context{builder}
	return g.Generate(ctx)
}
