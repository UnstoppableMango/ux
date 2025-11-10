package parser

import (
	"fmt"

	"github.com/charmbracelet/log"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/cli"
)

var (
	NoOp          plugin.Parser = Func(noOp)
	LocalFile     plugin.Parser = Func(cli.ParseLocalFile)
	LocalFileName plugin.Parser = Func(cli.ParseLocalFileName)

	Default plugin.Parser = FirstSuccesful([]plugin.Parser{
		cli.Exact("dummy"),
		cli.EnvVar("ALLOW_PLUGIN"),
		LocalFile,
		LocalFileName,
	})
)

type Func func(plugin.String) (ux.Plugin, error)

func (fn Func) Parse(name plugin.String) (ux.Plugin, error) {
	return fn(name)
}

type FirstSuccesful []plugin.Parser

func (parsers FirstSuccesful) Parse(name plugin.String) (ux.Plugin, error) {
	for _, parser := range parsers {
		if p, err := parser.Parse(name); err == nil {
			return p, nil
		} else {
			log.Debug("Parser failed", "err", err)
		}
	}

	return nil, fmt.Errorf("no parser satisfied: %s", name)
}

func noOp(plugin.String) (ux.Plugin, error) {
	return nil, nil
}
