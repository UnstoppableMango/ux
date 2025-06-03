package json

import "encoding/json"

type Marshaler struct{}

func (Marshaler) Marshal(v any) ([]byte, error) {
	return json.Marshal(v)
}

func (Marshaler) Unmarshal(data []byte, v any) error {
	return json.Unmarshal(data, v)
}
