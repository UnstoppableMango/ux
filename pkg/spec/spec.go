package spec

import (
	"fmt"

	ux "github.com/unstoppablemango/ux/pkg"
)

type Token string

func (t Token) String() string {
	return string(t)
}

func (t Token) Token() Token {
	return t
}

func (t Token) Matches(v string) bool {
	return v == t.String()
}

func BinName(source, target Token) string {
	return fmt.Sprintf("%s2%s", source, target)
}

func Match(a, b ux.Spec) bool {
	return a.String() == b.String()
}
