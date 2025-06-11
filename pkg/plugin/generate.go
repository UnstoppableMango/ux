package plugin

import (
	"context"

	filev1alpha1 "buf.build/gen/go/unmango/protofs/protocolbuffers/go/dev/unmango/file/v1alpha1"
	"github.com/charmbracelet/log"
	"github.com/google/uuid"
	"github.com/spf13/afero"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/fs"
	"github.com/unstoppablemango/ux/pkg/input"
)

func Generate(ctx context.Context, name string, input ux.Input) (afero.Fs, error) {
	plugin := LocalBinary(name) // TODO: Infer the plugin type

	inputs := []*filev1alpha1.File{}
	for name := range input.Sources() {
		inputs = append(inputs, &filev1alpha1.File{
			Name: name,
		})
	}

	lis, err := fs.Listen(ctx)
	if err != nil {
		return nil, err
	}

	output := afero.NewMemMapFs()
	srv := fs.NewServer(serverFs(input, output))
	defer srv.GracefulStop()

	go func() {
		if err := srv.Serve(lis); err != nil {
			log.Error(err)
		}
	}()

	id := uuid.NewString()
	res, err := plugin.Generate(ctx, &uxv1alpha1.GenerateRequest{
		Id:        id,
		Inputs:    inputs,
		FsAddress: lis.Addr().String(),
	})
	if err != nil {
		return nil, err
	}

	log.Info("Got outputs", "files", res.Outputs)
	return output, err
}

func serverFs(i ux.Input, output afero.Fs) afero.Fs {
	return afero.NewCopyOnWriteFs(input.NewFs(i), output)
}
