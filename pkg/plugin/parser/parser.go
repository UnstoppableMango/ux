package parser

import (
	"fmt"

	"github.com/charmbracelet/log"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/cli"
)

var (
	NoOp plugin.Parser = Func(noOp)

	Default = FirstSuccesful([]plugin.Parser{
		Func(LocalFile),
	})
)

type Func func(string) (ux.Plugin, error)

func (fn Func) Parse(name string) (ux.Plugin, error) {
	return fn(name)
}

func noOp(string) (ux.Plugin, error) {
	return nil, nil
}

type FirstSuccesful []plugin.Parser

func (parsers FirstSuccesful) Parse(name string) (ux.Plugin, error) {
	for _, parser := range parsers {
		if p, err := parser.Parse(name); err == nil {
			return p, nil
		} else {
			log.Debug("Parser failed", "err", err)
		}
	}

	return nil, fmt.Errorf("no parser satisfied: %s", name)
}

func LocalFile(v string) (ux.Plugin, error) {
	if plugin.BinPattern.MatchString(v) {
		return cli.Plugin(v), nil
	} else {
		return nil, fmt.Errorf("%s did not satisfy %s", v, plugin.BinPattern)
	}
}
