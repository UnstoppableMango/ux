package cli

import (
	"context"
	"io"

	ux "github.com/unstoppablemango/ux/pkg"
)

type Argument struct {
	name    string
	aliases []string
}

// Alias implements ux.Option.
func (b *Argument) Alias(v string) {
	b.aliases = append(b.aliases, v)
}

// Name implements ux.Option.
func (b *Argument) Name(v string) {
	b.name = v
}

type Builder struct{
	inputs map[string]*Argument
}

// Input implements ux.Builder.
func (b *Builder) Input(c ux.Configure) string {
	opt := &Argument{}
	c.Configure(opt)
	b.inputs[opt.name] = opt
	return opt.name
}

type Context struct{
	inputs map[string]*Argument
}

// Context implements ux.Context.
func (c *Context) Context() context.Context {
	return context.TODO()
}

// Input implements ux.Context.
func (c *Context) Input(name string) (io.Reader, error) {
	panic("unimplemented")
}

// Output implements ux.Context.
func (c *Context) Output(name string) (io.Writer, error) {
	panic("unimplemented")
}

func Execute(g ux.Generator) error {
	builder := &Builder{}
	if err := g.Configure(builder); err != nil {
		return err
	}

	ctx := &Context{builder.inputs}
	return g.Generate(ctx)
}
