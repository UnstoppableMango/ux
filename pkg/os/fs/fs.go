package fs

import (
	"github.com/spf13/afero"
	"github.com/unstoppablemango/ux/pkg/os"
)

func TempDir(os os.Os, prefix string) (string, error) {
	return afero.TempDir(os.Fs(), os.TempDir(), prefix)
}

func TempFile(os os.Os, pattern string) (afero.File, error) {
	return afero.TempFile(os.Fs(), os.TempDir(), pattern)
}
