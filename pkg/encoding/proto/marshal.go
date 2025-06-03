package proto

import (
	"fmt"

	"google.golang.org/protobuf/proto"
)

type Marshaler struct{}

func (Marshaler) Marshal(v any) ([]byte, error) {
	if msg, ok := v.(proto.Message); !ok {
		return nil, fmt.Errorf("unsupported value")
	} else {
		return proto.Marshal(msg)
	}
}

func (Marshaler) Unmarshal(data []byte, v any) error {
	if msg, ok := v.(proto.Message); !ok {
		return fmt.Errorf("must be a proto.Message")
	} else {
		return proto.Unmarshal(data, msg)
	}
}
