package fs

import (
	"os"

	"github.com/spf13/afero"
)

type IO struct {
	in, out afero.Fs
	context string
}

func NewIO(fs afero.Fs, context string) IO {
	return IO{in: fs, out: fs, context: context}
}

func (io IO) Open(name string) ([]byte, error) {
	return afero.ReadFile(io.in, name)
}

func (io IO) Write(name string, data []byte) error {
	return afero.WriteFile(io.out, name, data, os.ModePerm)
}
