package config

import (
	"context"
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
	files []uuid.UUID
}

func (b *Builder) File() uuid.UUID {
	id := uuid.New()
	b.files = append(b.files, id)
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
	panic("unimplemented")
}

// Output implements ux.Context.
func (c *Context) Output() (io.Writer, error) {
	panic("unimplemented")
}

func Execute(g ux.Generator) error {
	builder := &Builder{}
	if err := g.Configure(builder); err != nil {
		return err
	}

	ctx := &Context{builder}
	return g.Generate(ctx)
}
