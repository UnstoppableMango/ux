package output

import (
	"archive/tar"
	"io"
	"os"

	v1 "github.com/google/go-containerregistry/pkg/v1"
	"github.com/google/go-containerregistry/pkg/v1/empty"
	"github.com/google/go-containerregistry/pkg/v1/mutate"
	"github.com/google/go-containerregistry/pkg/v1/tarball"
	"github.com/spf13/afero"
)

func Collect(fsys afero.Fs, outputs []string) (v1.Image, error) {
	f, err := afero.TempFile(fsys, "", "ux-*.tar")
	if err != nil {
		return nil, err
	}
	defer f.Close()

	tw := tar.NewWriter(f)
	defer tw.Close()

	for _, output := range outputs {
		if err = writeOutput(fsys, output, tw); err != nil {
			return nil, err
		}
	}

	l, err := tarball.LayerFromOpener(func() (io.ReadCloser, error) {
		return fsys.OpenFile(f.Name(), os.O_RDONLY, os.ModePerm)
	})
	if err != nil {
		return nil, err
	}

	a := mutate.Addendum{Layer: l}
	if img, err := mutate.Append(empty.Image, a); err != nil {
		return nil, err
	} else {
		return img, nil
	}
}

func writeOutput(fsys afero.Fs, output string, tw *tar.Writer) error {
	f, err := fsys.OpenFile(output, os.O_RDONLY, os.ModePerm)
	if err != nil {
		return err
	}
	defer f.Close()

	info, err := f.Stat()
	if err != nil {
		return err
	}

	hdr, err := tar.FileInfoHeader(info, "")
	if err != nil {
		return err
	}

	if err := tw.WriteHeader(hdr); err != nil {
		return err
	}

	if _, err := io.Copy(tw, f); err != nil {
		return err
	}

	return nil
}
