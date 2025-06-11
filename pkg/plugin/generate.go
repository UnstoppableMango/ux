package plugin

import (
	"context"

	filev1alpha1 "buf.build/gen/go/unmango/protofs/protocolbuffers/go/dev/unmango/file/v1alpha1"
	"github.com/google/uuid"
	"github.com/spf13/afero"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	ux "github.com/unstoppablemango/ux/pkg"
)

func Generate(ctx context.Context, name string, input ux.Input) (afero.Fs, error) {
	plugin := LocalBinary(name)

	inputs := []*filev1alpha1.File{}
	for name := range input.Sources() {
		inputs = append(inputs, &filev1alpha1.File{
			Name: name,
		})
	}

	id := uuid.NewString()
	_, err := plugin.Generate(ctx, &uxv1alpha1.GenerateRequest{
		Id:     id,
		Inputs: inputs,
	})
	if err != nil {
		return nil, err
	}

	return nil, err
}
