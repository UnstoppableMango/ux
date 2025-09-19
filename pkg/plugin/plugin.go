package plugin

import (
	"context"
	"fmt"
	"io/fs"
	"iter"
	"os"
	"regexp"
	"strings"

	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/plugin/cli"
	"github.com/unstoppablemango/ux/pkg/spec"
)

var (
	BinPattern = regexp.MustCompile(`^([\w\-]+2[\w\-]+)|(ux-[\w\-]+)$`)
)

type Selector interface {
	Select(iter.Seq[ux.Plugin]) (ux.Plugin, error)
}

type Source interface {
	Load(context.Context) (ux.Plugin, error)
}

type Registry interface {
	List() iter.Seq[Source]
}

type localfile struct {
	path string
	info fs.FileInfo
}

// Generator implements ux.Plugin.
func (l localfile) Generator(source, target ux.Spec) (ux.Generator, error) {
	a, b, ok := strings.Cut(l.info.Name(), "2")
	sourceMatches := spec.Match(source, spec.Token(a))
	targetMatches := spec.Match(target, spec.Token(b))

	if ok && sourceMatches && targetMatches {
		return cli.Generator(l.path, source, target), nil
	}

	return nil, fmt.Errorf("%s does not suppport generating %s from %s", l, target, source)
}

func (l localfile) String() string {
	return l.path
}

func LocalFile(path string) (ux.Plugin, error) {
	if info, err := os.Stat(path); err != nil {
		return nil, err
	} else if info.IsDir() {
		return nil, fmt.Errorf("not a file: %s", path)
	} else {
		return localfile{path, info}, nil
	}
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

// Generator implements ux.Plugin.
func (p withGenerator) Generator(ux.Spec, ux.Spec) (ux.Generator, error) {
	return p.g, nil
}
