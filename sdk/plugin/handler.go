package plugin

import (
	"context"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
)

//go:generate go tool mockgen -destination zz_generated.mock.go -package plugin . Handler

type Handler interface {
	Generate(context.Context, *uxv1alpha1.Payload) (*uxv1alpha1.Payload, error)
}
