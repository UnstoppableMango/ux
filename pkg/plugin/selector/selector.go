package selector

import (
	"fmt"

	"github.com/charmbracelet/log"
	"github.com/unmango/go/iter"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/plugin"
)

type Func func(iter.Seq[ux.Plugin]) (ux.Plugin, error)

func (fn Func) Select(plugins iter.Seq[ux.Plugin]) (ux.Plugin, error) {
	return fn(plugins)
}

func Default(source, target ux.Spec) plugin.Selector {
	return firstGenerator{source, target}
}

type firstGenerator struct {
	source, target ux.Spec
}

func (s firstGenerator) Select(plugins iter.Seq[ux.Plugin]) (ux.Plugin, error) {
	for p := range plugins {
		if g, err := p.Generator(s.source, s.target); err == nil {
			return plugin.ForGenerator(g), nil
		} else {
			log.Debug("No generator", "plugin", p, "source", s.source, "target", s.target)
		}
	}

	return nil, fmt.Errorf("no generator for source: %s, target: %s", s.source, s.target)
}
