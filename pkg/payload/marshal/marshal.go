package marshal

import (
	"encoding/json"

	"github.com/unmango/go/option"
	ux "github.com/unstoppablemango/ux/pkg"
	"gopkg.in/yaml.v3"
)

var (
	Json = jsonMarshaler{}
	Yaml = yamlMarshaler{}
)

type Union interface {
	ux.Marshaler
	ux.Unmarshaler
}

type Options struct {
	Json Union
	Yaml Union
}

type Option func(*Options)

func Select(target string, options []Option) Union {
	opts := Options{Json: Json, Yaml: Yaml}
	option.ApplyAll(&opts, options)

	return opts.Yaml
}

type jsonMarshaler struct{}

func (jsonMarshaler) Marshal(v any) ([]byte, error) {
	return json.Marshal(v)
}

func (jsonMarshaler) Unmarshal(data []byte, v any) error {
	return json.Unmarshal(data, v)
}

type yamlMarshaler struct{}

func (yamlMarshaler) Marshal(v any) ([]byte, error) {
	return yaml.Marshal(v)
}

func (yamlMarshaler) Unmarshal(data []byte, v any) error {
	return yaml.Unmarshal(data, v)
}
