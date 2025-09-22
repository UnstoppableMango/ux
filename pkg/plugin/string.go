package plugin

import (
	"fmt"

	ux "github.com/unstoppablemango/ux/pkg"
)

type String string

func (s String) String() string {
	return string(s)
}

func (s String) Execute(args []string) error {
	if p, err := s.Plugin(); err != nil {
		return fmt.Errorf("executing %s: %w", s, err)
	} else {
		return p.Execute(args)
	}
}

func (s String) Plugin() (ux.Plugin, error) {
	return Parse(s.String(), nil)
}
