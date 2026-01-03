package cmd

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
	"github.com/spf13/cobra"
	"github.com/unmango/go/cli"
	"github.com/unmango/go/os"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/config"
	"github.com/unstoppablemango/ux/pkg/input"
	"github.com/unstoppablemango/ux/pkg/spec"
	"github.com/unstoppablemango/ux/pkg/work"
)

func NewGenerate() *cobra.Command {
	return &cobra.Command{
		Use:     "generate [TARGET] [INPUT] [ARGS...]",
		Short:   "Generate code",
		Aliases: []string{"gen"},
		Args: func(cmd *cobra.Command, args []string) error {
			if len(args) != 0 && len(args) < 2 {
				return fmt.Errorf("either provide no arguments to generate all targets or provide TARGET and INPUT to generate a specific target")
			}

			return nil
		},
		Run: func(cmd *cobra.Command, args []string) {
			var err error

			ctx := cmd.Context()
			if len(args) == 0 {
				err = generateConfig(ctx)
			} else {
				err = generateTarget(ctx, args)
			}

			if err != nil {
				cli.Fail(err)
			}
		},
	}
}

func generateConfig(ctx context.Context) error {
	conf, err := config.Read(config.NewViper())
	if err != nil {
		return fmt.Errorf("reading config: %w", err)
	}

	for n, target := range conf.Targets {
		log := log.With("name", n, "type", target.Type)

		log.Info("Generating target")
		if target.Type != "cli" {
			log.Warn("Unsupported target")
			continue
		}

		command := target.Command
		if len(command) == 0 {
			log.Error("No command specified for target")
			continue
		}

		log.Info("Creating workspace")
		os := os.FromContext(ctx)
		workspace, err := os.MkdirTemp("", "")
		if err != nil {
			log.Errorf("Creating workspace: %s", err)
			continue
		}

		log = log.With("workspace", workspace)
		defer cleanup(os, workspace)

		cwd, err := os.Getwd()
		if err != nil {
			log.Errorf("Getting current working directory: %s", err)
			continue
		}

		if err := linkFiles(os, cwd, workspace, target.Inputs); err != nil {
			log.Errorf("Linking inputs: %s", err)
			continue
		}

		inbuf := &bytes.Buffer{}
		tw := tar.NewWriter(inbuf)
		defer tw.Close()

		if err = tw.AddFS(os.DirFS(workspace)); err != nil {
			log.Errorf("Creating workspace tarball: %s", err)
			continue
		}

		if err = tw.Flush(); err != nil {
			log.Errorf("Flushing output tarball: %s", err)
		}

		l, err := tarball.LayerFromOpener(
			func() (io.ReadCloser, error) {
				return io.NopCloser(inbuf), nil
			},
			tarball.WithMediaType(types.OCILayer),
		)
		if err != nil {
			log.Errorf("Creating tar layer: %s", err)
			continue
		}

		img, err := mutate.AppendLayers(empty.Image, l)
		if err != nil {
			log.Errorf("Creating input layer: %s", err)
			continue
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
			log.Errorf("Creating output temp dir: %s", err)
			continue
		}
		defer cleanup(os, output)

		if err = linkFiles(os, workspace, output, target.Outputs); err != nil {
			log.Errorf("Linking outputs: %s", err)
			continue
		}

		if err := tw.AddFS(os.DirFS(output)); err != nil {
			log.Errorf("Creating output tarball: %s", err)
			continue
		}

		if err = tw.Flush(); err != nil {
			log.Errorf("Flushing output tarball: %s", err)
		}

		l, err = tarball.LayerFromOpener(
			func() (io.ReadCloser, error) {
				return io.NopCloser(inbuf), nil
			},
			tarball.WithMediaType(types.OCILayer),
		)
		if err != nil {
			log.Errorf("Creating tar layer: %s", err)
			continue
		}

		img, err = mutate.AppendLayers(img, l)
		if err != nil {
			log.Errorf("Appending output layer: %s", err)
			continue
		}

		tag, err := name.NewTag("output")
		if err != nil {
			log.Errorf("Creating output tag: %s", err)
			continue
		}

		outpath := filepath.Join(cwd, "out.tar")
		if err := tarball.WriteToFile(outpath, tag, img); err != nil {
			log.Errorf("Writing output tarball to file: %s", err)
			continue
		}
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

func generateTarget(ctx context.Context, args []string) error {
	target := spec.Token(args[0])
	input, err := input.Parse(args[1])
	if err != nil {
		return fmt.Errorf("parsing input: %w", err)
	}

	ws, err := work.Cwd()
	if err != nil {
		return fmt.Errorf("getting current workspace: %w", err)
	}

	if err := ux.Generate(ctx, ws, target, input); err != nil {
		return fmt.Errorf("generating code: %w", err)
	}

	return nil
}
