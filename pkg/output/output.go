package output

import (
	"context"

	"github.com/charmbracelet/log"
	"github.com/spf13/afero"
	"oras.land/oras-go/v2"
	"oras.land/oras-go/v2/content"
	"oras.land/oras-go/v2/content/oci"
)

func Collect(fsys afero.Fs, outputs []string) (oras.ReadOnlyTarget, error) {
	tmp, err := afero.TempDir(fsys, "", "ux-")
	if err != nil {
		return nil, err
	}
	// defer fsys.RemoveAll(tmp)

	ctx := context.Background()
	store, err := oci.NewWithContext(ctx, tmp)
	if err != nil {
		return nil, err
	}

	log.Info("Writing", "dir", tmp)
	for _, output := range outputs {
		if err := writeOutput(ctx, fsys, output, store); err != nil {
			return nil, err
		}
	}

	_, err = oras.PackManifest(ctx, store,
		oras.PackManifestVersion1_1,
		"example/test",
		oras.PackManifestOptions{},
	)

	return store, nil
}

func writeOutput(ctx context.Context, fsys afero.Fs, output string, p content.Pusher) error {
	f, err := fsys.Open(output)
	if err != nil {
		return err
	}
	defer f.Close()

	data, err := afero.ReadAll(f)
	if err != nil {
		return err
	}

	_, err = oras.PushBytes(ctx, p, "", data)

	return err
}
