package target

import (
	"archive/tar"
	"bytes"
	"context"
	"fmt"
	"io"
	"os/exec"
	"path/filepath"

	"github.com/charmbracelet/log"
	"github.com/google/go-containerregistry/pkg/name"
	v1 "github.com/google/go-containerregistry/pkg/v1"
	"github.com/google/go-containerregistry/pkg/v1/empty"
	"github.com/google/go-containerregistry/pkg/v1/mutate"
	"github.com/google/go-containerregistry/pkg/v1/stream"
	"github.com/google/go-containerregistry/pkg/v1/tarball"
	"github.com/google/go-containerregistry/pkg/v1/types"
	"github.com/unmango/go/os"
	"github.com/unstoppablemango/ux/pkg/config"
)

func Generate(ctx context.Context, target config.Target) error {
	log := log.FromContext(ctx)
	log.Info("Generating target")
	if target.Type != "cli" {
		return fmt.Errorf("unsupported target type: %s", target.Type)
	}

	command := target.Command
	if len(command) == 0 {
		return fmt.Errorf("no command specified")
	}

	log.Info("Creating workspace")
	os := os.FromContext(ctx)
	workspace, err := os.MkdirTemp("", "")
	if err != nil {
		return fmt.Errorf("creating workspace: %w", err)
	}

	log = log.With("workspace", workspace)
	defer cleanup(os, workspace)

	cwd, err := os.Getwd()
	if err != nil {
		return fmt.Errorf("reading cwd: %w", err)
	}

	if err := linkFiles(os, cwd, workspace, target.Inputs); err != nil {
		return fmt.Errorf("linking inputs: %w", err)
	}

	inbuf := &bytes.Buffer{}
	tw := tar.NewWriter(inbuf)
	defer tw.Close()

	if err = tw.AddFS(os.DirFS(workspace)); err != nil {
		return fmt.Errorf("creating workspace tarball: %w", err)
	}

	if err = tw.Flush(); err != nil {
		return fmt.Errorf("flushing output tarball: %w", err)
	}

	l, err := tarball.LayerFromOpener(
		func() (io.ReadCloser, error) {
			return io.NopCloser(inbuf), nil
		},
		tarball.WithMediaType(types.OCILayer),
	)
	if err != nil {
		return fmt.Errorf("creating tar layer: %w", err)
	}

	img, err := mutate.AppendLayers(empty.Image, l)
	if err != nil {
		return fmt.Errorf("creating input layer: %w", err)
	}

	cmd := exec.CommandContext(ctx, command[0])
	cmd.Args = append(command, target.Args...)
	cmd.Dir = workspace

	log.Info("Running CLI", "command", cmd.Args)
	if out, err := cmd.CombinedOutput(); err != nil {
		log.Error("Running command", "err", err, "out", string(out))
	} else {
		log.Info("Command output", "out", string(out))
	}

	outbuf := &bytes.Buffer{}
	tw = tar.NewWriter(outbuf)
	defer tw.Close()

	output, err := os.MkdirTemp("", "")
	if err != nil {
		return fmt.Errorf("creating output temp dir: %w", err)
	}
	defer cleanup(os, output)

	if err = linkFiles(os, workspace, output, target.Outputs); err != nil {
		return fmt.Errorf("linking outputs: %w", err)
	}

	if err := tw.AddFS(os.DirFS(output)); err != nil {
		return fmt.Errorf("creating output tarball: %w", err)
	}

	if err = tw.Flush(); err != nil {
		return fmt.Errorf("flushing output tarball: %w", err)
	}

	l, err = tarball.LayerFromOpener(
		func() (io.ReadCloser, error) {
			return io.NopCloser(inbuf), nil
		},
		tarball.WithMediaType(types.OCILayer),
	)
	if err != nil {
		return fmt.Errorf("creating tar layer: %w", err)
	}

	img, err = mutate.AppendLayers(img, l)
	if err != nil {
		return fmt.Errorf("appending output layer: %w", err)
	}

	tag, err := name.NewTag("output")
	if err != nil {
		return fmt.Errorf("creating output tag: %w", err)
	}

	outpath := filepath.Join(cwd, "out.tar")
	if err := tarball.WriteToFile(outpath, tag, img); err != nil {
		return fmt.Errorf("writing output tarball to file: %w", err)
	}

	return nil
}

func linkFiles(os os.Os, cwd, workspace string, files []string) error {
	for _, f := range files {
		if !filepath.IsAbs(f) {
			f = filepath.Join(cwd, f)
		}

		link := filepath.Join(workspace, filepath.Base(f))
		if err := os.Symlink(f, link); err != nil {
			return fmt.Errorf("linking input %s: %w", f, err)
		} else {
			log.Infof("Linked input %s to %s", f, link)
		}
	}

	return nil
}

func packageInputs(os os.Os, cwd string, inputs []string) (v1.Image, error) {
	buf := &bytes.Buffer{}
	tw := tar.NewWriter(buf)
	defer tw.Close()

	for _, input := range inputs {
		if !filepath.IsAbs(input) {
			input = filepath.Join(cwd, input)
		}

		f, err := os.ReadFile(input)
		if err != nil {
			return nil, fmt.Errorf("reading input %s: %w", input, err)
		}

		hdr := &tar.Header{
			Name: filepath.Base(input),
			Size: int64(len(f)),
			Mode: 0x700,
		}

		if err = tw.WriteHeader(hdr); err != nil {
			return nil, fmt.Errorf("writing header for input %s: %w", input, err)
		}

		if _, err = tw.Write(f); err != nil {
			return nil, fmt.Errorf("writing file for input %s: %w", input, err)
		}
	}

	img, err := mutate.AppendLayers(empty.Image,
		stream.NewLayer(io.NopCloser(buf)),
	)
	if err != nil {
		return nil, fmt.Errorf("creating image layer: %w", err)
	}

	return img, nil
}

func cleanup(os os.Os, workspace string) {
	log.Info("Cleaning up workspace")
	if err := os.RemoveAll(workspace); err != nil {
		log.Errorf("Cleaning up workspace: %s", err)
	}
}
