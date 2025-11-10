package parser

import (
	"fmt"

	"github.com/charmbracelet/log"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/plugin"
)

var NoOp plugin.Parser = Func(noOp)

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
