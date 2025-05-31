package marshal

import (
	"encoding/json"
	"fmt"

	"github.com/unmango/go/option"
	ux "github.com/unstoppablemango/ux/pkg"
	"google.golang.org/protobuf/proto"
	"gopkg.in/yaml.v3"
)

var (
	Json  = jsonMarshaler{}
	Yaml  = yamlMarshaler{}
	Proto = protoMarshaler{}
)

type Union interface {
	ux.Marshaler
	ux.Unmarshaler
}

type Options struct {
	Json  Union
	Proto Union
	Yaml  Union
}

type Option func(*Options)

func Select(target string, options []Option) Union {
	opts := Options{
		Json:  Json,
		Proto: Proto,
		Yaml:  Yaml,
	}
	option.ApplyAll(&opts, options)

	return opts.Proto // TODO
}

type jsonMarshaler struct{}

func (jsonMarshaler) Marshal(v any) ([]byte, error) {
	return json.Marshal(v)
}

func (jsonMarshaler) Unmarshal(data []byte, v any) error {
	return json.Unmarshal(data, v)
}

type protoMarshaler struct{}

func (protoMarshaler) Marshal(v any) ([]byte, error) {
	if msg, ok := v.(proto.Message); !ok {
		return nil, fmt.Errorf("unsupported value")
	} else {
		return proto.Marshal(msg)
	}
}

func (protoMarshaler) Unmarshal(data []byte, v any) error {
	if msg, ok := v.(proto.Message); !ok {
		return fmt.Errorf("must be a proto.Message")
	} else {
		return proto.Unmarshal(data, msg)
	}
}

type yamlMarshaler struct{}

func (yamlMarshaler) Marshal(v any) ([]byte, error) {
	return yaml.Marshal(v)
}

func (yamlMarshaler) Unmarshal(data []byte, v any) error {
	return yaml.Unmarshal(data, v)
}
