package plugin

import (
	"context"
	"fmt"
	"path/filepath"

	filev1alpha1 "buf.build/gen/go/unmango/protofs/protocolbuffers/go/dev/unmango/file/v1alpha1"
	"github.com/charmbracelet/log"
	"github.com/google/uuid"
	"github.com/spf13/afero"
	"github.com/unmango/aferox/mapped"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/fs"
	"github.com/unstoppablemango/ux/pkg/input"
)

func Generate(ctx context.Context, name string, in ux.Input) (afero.Fs, error) {
	plugin, err := Parse(name)
	if err != nil {
		return nil, err
	}

	inputs := []*filev1alpha1.File{}
	for name := range in.Sources() {
		log.Infof("Appending input: %s", filepath.Join("input", name))
		inputs = append(inputs, &filev1alpha1.File{
			Name: filepath.Join("input", name),
		})
	}

	log.Debug("Starting FS server")
	output := afero.NewMemMapFs()
	srv := fs.NewServer(mapped.NewFs(map[string]afero.Fs{
		"input":  input.NewFs(in),
		"output": output,
	}))
	defer srv.GracefulStop()

	lis, err := srv.Listen()
	if err != nil {
		return nil, err
	}

	go func() {
		log.Debug("Serving FS")
		if err := srv.Serve(lis); err != nil {
			log.Info("FS Server returned an error", "err", err)
		}
	}()

	log.Debug("Sending generate request")
	id := uuid.NewString()
	res, err := plugin.Generate(ctx, &uxv1alpha1.GenerateRequest{
		Id:        id,
		Inputs:    inputs,
		FsAddress: fmt.Sprintf("unix://%s", lis.Addr()),
	})
	if err != nil {
		return nil, err
	}

	log.Debug("Got outputs", "files", res.Outputs)
	for _, f := range res.Outputs {
		if stat, err := output.Stat(f.Name); err != nil {
			log.Debugf("No output found at: %s", f.Name)
		} else {
			log.Debugf("Found output: %s", stat.Name())
		}
	}

	return output, err
}
