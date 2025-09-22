package parser

import (
	"fmt"
	"os"

	"github.com/charmbracelet/log"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/cli"
	"github.com/unstoppablemango/ux/pkg/plugin/parser/parse"
)

// This is all incredibly weird, but I'm honing in on how I want it to work

var (
	NoOp          plugin.Parser = Func(parse.NoOp)
	LocalFile     plugin.Parser = Func(parse.LocalFile)
	LocalFileName plugin.Parser = Func(parse.LocalFileName)

	Default plugin.Parser = FirstSuccesful([]plugin.Parser{
		ExactCli("dummy"),
		EnvVarCli("ALLOW_PLUGIN"),
		LocalFile,
		LocalFileName,
	})
)

type Func func(string) (ux.Plugin, error)

func (fn Func) Parse(name string) (ux.Plugin, error) {
	return fn(name)
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

type ExactCli string

func (s ExactCli) Parse(v string) (ux.Plugin, error) {
	if string(s) == v {
		return cli.Plugin(v), nil
	} else {
		return nil, fmt.Errorf("%s did not exactly match %s", s, v)
	}
}

type EnvVarCli string

func (e EnvVarCli) String() string {
	return string(e)
}

func (name EnvVarCli) Parse(v string) (ux.Plugin, error) {
	if env, ok := os.LookupEnv(name.String()); ok && v == env {
		return cli.Plugin(env), nil
	} else {
		return nil, fmt.Errorf("%s did not match %s found in %s", v, env, name)
	}
}
