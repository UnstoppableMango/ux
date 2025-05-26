package lockfile

import (
	"os"

	"github.com/spf13/afero"
	"google.golang.org/protobuf/proto"
)

type at[T proto.Message] string

func (path at[T]) String() string {
	return string(path)
}

func (path at[T]) Read(fs afero.Fs) (T, error) {
	data, err := afero.ReadFile(fs, path.String())
	if err != nil {
		return path.empty(), err
	}

	var lock T
	if err := proto.Unmarshal(data, lock); err != nil {
		return path.empty(), err
	} else {
		return lock, nil
	}
}

func (path at[T]) Write(fs afero.Fs, lock T) error {
	data, err := proto.Marshal(lock)
	if err != nil {
		return err
	}

	return afero.WriteFile(fs, path.String(), data, os.ModePerm)
}

func (path at[T]) empty() (x T) {
	return x
}
