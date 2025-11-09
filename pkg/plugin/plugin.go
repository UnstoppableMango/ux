package plugin

import (
	"context"
	"iter"
	"regexp"

	ux "github.com/unstoppablemango/ux/pkg"
)

var (
	BinPattern = regexp.MustCompile(`^([\w\-]+2[\w\-]+)|(ux-[\w\-]+)$`)
)

type Ux interface {
	InputFile() string
	OutputPath() string
}

type Selector interface {
	Select(iter.Seq[ux.Plugin]) (ux.Plugin, error)
}

type Source interface {
	Load(context.Context) (ux.Plugin, error)
}

type Registry interface {
	Sources() iter.Seq[Source]
}

type Parser interface {
	Parse(string) (ux.Plugin, error)
}

func Parse(name string, parser Parser) (ux.Plugin, error) {
	return parser.Parse(name)
}

func ForGenerator(g ux.Generator) ux.Plugin {
	return withGenerator{g}
}

type withGenerator struct {
	g ux.Generator
}

// Execute implements ux.Plugin.
func (p withGenerator) Execute(args []string) error {
	panic("unimplemented")
}

// Generator implements ux.Plugin.
func (p withGenerator) Generator(ux.Spec, ux.Spec) (ux.Generator, error) {
	return p.g, nil
}
