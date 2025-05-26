package host

import "github.com/unstoppablemango/ux/sdk"

func Parse(value string) (sdk.Host, error) {
	switch value {
	default:
		return sdk.Host(value), nil
	}
}
