package cli

import (
	"fmt"

	"github.com/unmango/go/os"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/parser"
)

var Parser plugin.Parser = parser.FirstSuccesful{
	parser.Func(ParseExistingFile),
	parser.Func(ParseLocalFile),
	Exact("dummy"),
	EnvVar("ALLOW_PLUGIN"),
}

func ParseExistingFile(v plugin.String) (ux.Plugin, error) {
	if stat, err := v.Stat(os.System); err != nil {
		return nil, err
	} else if stat.IsDir() {
		return nil, fmt.Errorf("not a file: %s", v)
	} else {
		return Plugin{Name: v.String()}, nil
	}
}

func ParseLocalFile(v plugin.String) (ux.Plugin, error) {
	if v.IsBin() {
		return ParseExistingFile(v)
	} else {
		return nil, fmt.Errorf("%s did not satisfy %s", v, plugin.BinPattern)
	}
}

func ParseLocalFileName(v plugin.String) (ux.Plugin, error) {
	return ParseLocalFile(v.Base())
}

type Exact string

func (s Exact) Parse(v plugin.String) (ux.Plugin, error) {
	if plugin.String(s) == v {
		return Plugin{Name: v.String()}, nil
	} else {
		return nil, fmt.Errorf("%s did not exactly match %s", s, v)
	}
}

type EnvVar string

func (e EnvVar) String() string {
	return string(e)
}

func (name EnvVar) Parse(v plugin.String) (ux.Plugin, error) {
	if env, ok := os.System.LookupEnv(name.String()); ok && v.String() == env {
		return Plugin{Name: env}, nil
	} else {
		return nil, fmt.Errorf("%s did not match %s found in %s", v, env, name)
	}
}
