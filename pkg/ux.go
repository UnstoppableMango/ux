package pkg

import (
	"archive/tar"
	"bytes"
	"fmt"
	"io"
	"os"
	"os/exec"
	"text/template"

	"github.com/charmbracelet/log"
	"github.com/goccy/go-yaml"
	v1 "github.com/google/go-containerregistry/pkg/v1"
	"github.com/google/go-containerregistry/pkg/v1/empty"
	"github.com/google/go-containerregistry/pkg/v1/mutate"
	"github.com/google/go-containerregistry/pkg/v1/tarball"
	"github.com/spf13/afero"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
)

type (
	Config = uxv1alpha1.Config_builder

	Vars struct {
		Work string
	}
)

func Execute(fs afero.Fs, wd string) error {
	log.Infof("Working directory: %s", wd)
	file, err := FindConfig(fs, wd)
	if err != nil {
		return err
	}

	log.Infof("Using config file: %s", file)
	c, err := ReadConfig(fs, file)
	if err != nil {
		return err
	}

	vars := Vars{Work: wd}

	log.Infof("Config: %+v\n", c)
	cmd, err := BuildCommand(c.Command, vars)
	if err != nil {
		return err
	}

	log.Infof("Executing command: %s", cmd.String())
	if err := cmd.Run(); err != nil {
		return err
	}

	img, err := CollectOutput(fs, c.Outputs, vars)
	if err != nil {
		return err
	}

	layers, err := img.Layers()
	if err != nil {
		return err
	}

	for _, layer := range layers {
		r, err := layer.Uncompressed()
		if err != nil {
			return err
		}
		defer r.Close()

		tr := tar.NewReader(r)
		hdr, err := tr.Next()
		if err != nil {
			return err
		}
		log.Infof("Processing file: %s", hdr.Name)

		s, err := io.ReadAll(tr)
		if err != nil {
			return err
		}
		log.Infof("Data: %s", string(s))
	}

	return nil
}

func CollectOutput(fsys afero.Fs, outputs []string, vars Vars) (v1.Image, error) {
	outputs, err := ReplaceVariables(outputs, vars)
	if err != nil {
		return nil, err
	}

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

	header, err := tar.FileInfoHeader(info, "")
	if err != nil {
		return err
	}

	if err := tw.WriteHeader(header); err != nil {
		return err
	}

	if _, err := io.Copy(tw, f); err != nil {
		return err
	}

	return nil
}

func BuildCommand(cmd []string, vars Vars) (*exec.Cmd, error) {
	if result, err := ReplaceVariables(cmd, vars); err != nil {
		return nil, err
	} else {
		return exec.Command(result[0], result[1:]...), nil
	}
}

func ReplaceVariables(parts []string, vars Vars) ([]string, error) {
	var result []string
	for _, part := range parts {
		if replaced, err := Template(part, vars); err != nil {
			return nil, err
		} else {
			result = append(result, replaced)
		}
	}

	return result, nil
}

func Template(v string, vars Vars) (string, error) {
	t, err := template.New("ux").Parse(v)
	if err != nil {
		return "", fmt.Errorf("error parsing template: %w", err)
	}

	var buf bytes.Buffer
	if err = t.Execute(&buf, vars); err != nil {
		return "", fmt.Errorf("error executing template: %w", err)
	}

	return buf.String(), nil
}

func FindConfig(fs afero.Fs, wd string) (string, error) {
	matches, err := afero.Glob(fs, "config.y*ml")
	if err != nil {
		return "", err
	}

	if len(matches) == 0 {
		return "", fmt.Errorf("no config file found")
	}

	return matches[0], nil
}

func ReadConfig(fs afero.Fs, file string) (*Config, error) {
	data, err := afero.ReadFile(fs, file)
	if err != nil {
		return nil, err
	}

	c := &Config{}
	if err := yaml.Unmarshal(data, c); err != nil {
		return nil, err
	}

	return c, nil
}
