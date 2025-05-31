package payload

import (
	"io"

	"github.com/unstoppablemango/ux/pkg/payload/marshal"
)

type Decoder struct {
	r io.Reader
}

func NewDecoder(r io.Reader) *Decoder {
	return &Decoder{r: r}
}

func (d *Decoder) Decode()

func Decode(r io.Reader, v any, target string, options ...marshal.Option) error {
	d := NewDecoder(r)
	return NewDecoder(r)
}
