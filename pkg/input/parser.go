package input

import (
	"fmt"
	"os"
	"path/filepath"

	"github.com/charmbracelet/log"
	ux "github.com/unstoppablemango/ux/pkg"
)

type ParserFunc func(string) (ux.Input, error)

func (fn ParserFunc) Parse(v string) (ux.Input, error) {
	return fn(v)
}

type Parser interface {
	Parse(string) (ux.Input, error)
}

func Parse(v string) (ux.Input, error) {
	for _, p := range parsers {
		if i, err := p.Parse(v); err == nil {
			return i, nil
		} else {
			log.Debug("Parser failed", "parser", p, "err", err)
		}
	}

	return String(v), nil
}

func parseLocalFile(v string) (ux.Input, error) {
	if !filepath.IsAbs(v) && !filepath.IsLocal(v) {
		return nil, fmt.Errorf("not a filepath: %s", v)
	}

	if info, err := os.Stat(v); err != nil {
		return nil, err
	} else {
		return localfile{v, info}, nil
	}
}
