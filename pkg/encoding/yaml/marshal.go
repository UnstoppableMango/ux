package yaml

import "gopkg.in/yaml.v2"

type Marshaler struct{}

func (Marshaler) Marshal(v any) ([]byte, error) {
	return yaml.Marshal(v)
}

func (Marshaler) Unmarshal(data []byte, v any) error {
	return yaml.Unmarshal(data, v)
}
