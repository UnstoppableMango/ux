package local

import (
	"errors"
	"io/fs"
)

func IsNotFound(err error) bool {
	return errors.Is(err, fs.ErrNotExist)
}
