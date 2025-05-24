package host

import "github.com/unstoppablemango/ux/pkg/ux"

func Parse(value string) (ux.Host, error) {
	switch value {
	default:
		return ux.Host(value), nil
	}
}
