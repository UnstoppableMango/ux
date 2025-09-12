package input

import (
	"context"
	"fmt"
	"io"
	"io/fs"
	"os"
	"path/filepath"

	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/spec"
)

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

func Parse(v string) (ux.Input, error) {
	if filepath.IsAbs(v) || filepath.IsLocal(v) {
		if info, err := os.Stat(v); err != nil {
			return nil, err
		} else {
			return localfile{v, info}, nil
		}
	}

	return String(v), nil
}
