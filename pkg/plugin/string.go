package plugin

import (
	ux "github.com/unstoppablemango/ux/pkg"
)

type String string

func (s String) String() string {
	return string(s)
}

func (s String) IsBin() bool {
	return BinPattern.MatchString(s.String())
}

func (s String) Parse(parser Parser) (ux.Plugin, error) {
	return parser.Parse(s.String())
}
