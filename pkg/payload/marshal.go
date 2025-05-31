package payload

import (
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/payload/marshal"
)

func Marshal(v any, target string, options ...marshal.Option) (*uxv1alpha1.Payload, error) {
	m := marshal.Select(target, options)
	if data, err := m.Marshal(v); err != nil {
		return nil, err
	} else {
		return &uxv1alpha1.Payload{
			ContentType: target,
			Data:        data,
		}, nil
	}

}

func Unmarshal(payload *uxv1alpha1.Payload, v any, options ...marshal.Option) error {
	return marshal.Select(payload.ContentType, options).Unmarshal(payload.Data, v)
}
