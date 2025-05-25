package ux

import (
	"github.com/spf13/afero"
	"google.golang.org/protobuf/proto"
)

type LockFile[T proto.Message] interface {
	Read(afero.Fs) (T, error)
	Write(afero.Fs, T) error
}
