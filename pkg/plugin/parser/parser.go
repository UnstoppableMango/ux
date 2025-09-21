package parser

import (
	"fmt"
	"os"
	"path/filepath"

	"github.com/charmbracelet/log"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/cli"
)

// This is all incredibly weird, but I'm honing in on how I want it to work

var (
	NoOp plugin.Parser = Func(noOp)

	Default = FirstSuccesful([]plugin.Parser{
		ExactCli("dummy"),
		EnvVarCli("ALLOW_PLUGIN"),
		Func(LocalFile),
		Func(LocalFileName),
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

type ExactCli string

func (s ExactCli) Parse(v string) (ux.Plugin, error) {
	if string(s) == v {
		return cli.Plugin(v), nil
	} else {
		return nil, fmt.Errorf("%s did not exactly match %s", s, v)
	}
}

func LocalFile(v string) (ux.Plugin, error) {
	if plugin.BinPattern.MatchString(v) {
		return ExistingFile(v)
	} else {
		return nil, fmt.Errorf("%s did not satisfy %s", v, plugin.BinPattern)
	}
}

func LocalFileName(v string) (ux.Plugin, error) {
	return LocalFile(filepath.Base(v))
}

func ExistingFile(v string) (ux.Plugin, error) {
	if stat, err := os.Stat(v); err != nil {
		return nil, err
	} else if stat.IsDir() {
		return nil, fmt.Errorf("not a file: %s", v)
	} else {
		return cli.Plugin(v), nil
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
