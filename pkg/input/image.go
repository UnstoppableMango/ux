package input

import (
	"fmt"
	"io"

	"go.podman.io/storage"
	"go.podman.io/storage/types"
)

type Image struct {
	id string
}

func (i Image) Open() (io.Reader, error) {
	s, err := storage.GetStore(types.StoreOptions{})
	if err != nil {
		return nil, fmt.Errorf("getting storage store: %w", err)
	}

	image, err := s.Image(i.id)
	if err != nil {
		return nil, fmt.Errorf("getting image %q: %w", i.id, err)
	}

	l, err := s.Layer(image.TopLayer)
	if err != nil {
		return nil, fmt.Errorf("getting top layer %q: %w", image.TopLayer, err)
	}

	return nil, fmt.Errorf("todo")
}
