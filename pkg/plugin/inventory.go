package plugin

import "regexp"

var BinPattern = regexp.MustCompile(`(.+2.+)|(ux-.+)`)
