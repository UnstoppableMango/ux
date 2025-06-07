package payload

import (
	"fmt"
	"mime"

	"github.com/unmango/go/codec"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
)

func Codec(payload *uxv1alpha1.Payload) (codec.Codec, error) {
	typ, _, err := mime.ParseMediaType(payload.ContentType)
	if err != nil {
		return nil, err
	}

	switch typ {
	case "application/json":
		return codec.Json, nil
	case "application/protobuf", "application/x-protobuf",
		"application/vnd.google.protobuf", "application/x-google-protobuf":
		return codec.GoogleProto, nil
	case "application/yaml", "application/x-yaml", "text/yaml", "text/x-yaml":
		return codec.GoYaml, nil
	default:
		return nil, fmt.Errorf("unsupported content type: %s", payload.ContentType)
	}
}

func Unmarshal(payload *uxv1alpha1.Payload, v any) error {
	if codec, err := Codec(payload); err != nil {
		return err
	} else {
		return codec.Unmarshal(payload.Data, v)
	}
}
