package source

import ux "github.com/unstoppablemango/ux/pkg"

func Parse(i string) (ux.Source, error) {
	return File(i), nil
}
