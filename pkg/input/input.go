package input

import (
	"context"
	"fmt"
	"io"
	"io/fs"
	"os"

	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/spec"
)

var parsers = []Parser{
	ParserFunc(parseLocalFile),
}

type String string

func (s String) Spec(context.Context) (ux.Spec, error) {
	return spec.Token(s), nil
}

func (s String) Open() (io.Reader, error) {
	return nil, fmt.Errorf("todo")
}

type localfile struct {
	given string
	info  fs.FileInfo
}

// Open implements ux.Input.
func (l localfile) Open() (io.Reader, error) {
	return os.Open(l.given)
}

// Spec implements ux.Input.
func (l localfile) Spec(context.Context) (ux.Spec, error) {
	return spec.Token(l.given), nil
}
