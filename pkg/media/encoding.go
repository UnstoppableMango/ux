package media

import "github.com/unstoppablemango/ux/pkg/encoding"

func Encoding(typ string) (encoding.Type, error) {
	return encoding.Yaml, nil
}
