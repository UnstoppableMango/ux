package sink

import ux "github.com/unstoppablemango/ux/pkg"

func Parse(o string) (ux.Sink, error) {
	return File(o), nil
}
