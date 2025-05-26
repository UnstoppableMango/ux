package lockfile

import (
	"github.com/unstoppablemango/ux/pkg/ux"
	"google.golang.org/protobuf/proto"
)

func New[T proto.Message](path string) ux.LockFile[T] {
	return at[T](path)
}
