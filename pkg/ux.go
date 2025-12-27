package ux

import (
	"context"
	"fmt"
	"io"
	"iter"

	"github.com/charmbracelet/log"
	"github.com/spf13/afero"
)

type Context interface {
	Context() context.Context
	Input() afero.Fs
	Output() afero.Fs
}

type Spec interface {
	fmt.Stringer
}

type Phase interface {
	fmt.Stringer
	Run(Context) error
}

type Input interface {
	Open() (io.Reader, error)
	Spec(context.Context) (Spec, error)
}

type Generator interface {
	Generate(context.Context, Input) error
}

type Plugin interface {
	Execute(args []string) error
	Generator(source, target Spec) (Generator, error)
}

type Workspace interface {
	Plugins() iter.Seq[Plugin]
}

func Generate(ctx context.Context, work Workspace, target Spec, input Input) error {
	spec, err := input.Spec(ctx)
	if err != nil {
		return fmt.Errorf("reading input spec: %w", err)
	}

	if g, err := Pick(work.Plugins(), target, spec); err != nil {
		return err
	} else {
		return g.Generate(ctx, input)
	}
}

func Pick(plugins iter.Seq[Plugin], source, target Spec) (Generator, error) {
	for p := range plugins {
		if g, err := p.Generator(source, target); err == nil {
			return g, nil
		} else {
			log.Debug("No generator", "plugin", p, "source", source, "target", target)
		}
	}

	return nil, fmt.Errorf("no generator for source: %s, target: %s", source, target)
}
