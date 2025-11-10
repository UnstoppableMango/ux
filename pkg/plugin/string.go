package plugin

import (
	"path/filepath"

	"github.com/unmango/go/os"
	ux "github.com/unstoppablemango/ux/pkg"
)

type String string

func (s String) Base() String {
	return mapString(s, filepath.Base)
}

func (s String) IsBin() bool {
	return BinPattern.MatchString(s.String())
}

func (s String) Parse(parser Parser) (ux.Plugin, error) {
	return parser.Parse(s)
}

func (s String) Stat(os os.Os) (os.FileInfo, error) {
	return os.Stat(s.String())
}

func (s String) String() string {
	return string(s)
}

func mapString(s String, fn func(string) string) String {
	return String(fn(s.String()))
}
