package local

import (
	"regexp"
)

var (
	BinPattern = regexp.MustCompile(`(.+2.+)|(ux-.+)`)
)
