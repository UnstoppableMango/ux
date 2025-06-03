package encoding

import (
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/encoding/json"
	"github.com/unstoppablemango/ux/pkg/encoding/proto"
	"github.com/unstoppablemango/ux/pkg/encoding/yaml"
)

type Type string

const (
	Json  Type = "Json"
	Proto Type = "Protobuf"
	Yaml  Type = "Yaml"
)

func (t Type) Marshaler() ux.Marshaler {
	switch t {
	case Json:
		return json.Marshaler{}
	case Proto:
		return proto.Marshaler{}
	case Yaml:
		return yaml.Marshaler{}
	default:
		panic("unsupported encoding: " + t)
	}
}

func (t Type) Unmarshaler() ux.Unmarshaler {
	switch t {
	case Json:
		return json.Marshaler{}
	case Proto:
		return proto.Marshaler{}
	case Yaml:
		return yaml.Marshaler{}
	default:
		panic("unsupported encoding: " + t)
	}
}
