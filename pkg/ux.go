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
	"google.golang.org/protobuf/encoding/protojson"
)

type (
	Config  = uxv1alpha1.Config
	Package = uxv1alpha1.Package

	Vars struct {
		Work string
	}
)

func Execute(fsys afero.Fs, wd string) error {
	log.Infof("Working directory: %s", wd)
	file, err := FindConfig(fsys, wd)
	if err != nil {
		return err
	}

	log.Infof("Using config file: %s", file)
	c, err := ReadConfig(fsys, file)
	if err != nil {
		return err
	}

	vars := Vars{Work: wd}
	packages := c.GetPackages()
	images := make(map[string]v1.Image, len(packages))

	for name, pack := range c.GetPackages() {
		log.Infof("Processing package: %s", name)
		if img, err := Generate(fsys, pack, vars); err != nil {
			return err
		} else {
			images[name] = img
		}
	}

	for name, img := range images {
		if err := WriteImage(fsys, name, img); err != nil {
			return fmt.Errorf("writing image: %w", err)
		}
	}

	log.Info("Done")
	return nil
}

func WriteImage(fsys afero.Fs, pname string, img v1.Image) error {
	out, err := fsys.Create(pname + ".tar")
	if err != nil {
		return fmt.Errorf("creating file: %w", err)
	}
	defer out.Close()

	rc := mutate.Extract(img)
	defer rc.Close()

	if _, err = io.Copy(out, rc); err != nil {
		return fmt.Errorf("copying image: %w", err)
	}

	return nil
}

func Generate(fsys afero.Fs, pack *Package, vars Vars) (v1.Image, error) {
	log.Infof("Config: %+v\n", pack)
	cmd, err := BuildCommand(pack.GetCommand(), vars)
	if err != nil {
		return nil, fmt.Errorf("building command: %w", err)
	}

	log.Infof("Executing command: %s", cmd.String())
	if err := cmd.Run(); err != nil {
		return nil, fmt.Errorf("executing command: %w", err)
	}

	img, err := CollectOutput(fsys, pack.GetOutputs(), vars)
	if err != nil {
		return nil, fmt.Errorf("collecting output: %w", err)
	}

	return img, nil
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
		return nil, fmt.Errorf("reading config: %w", err)
	}

	data, err = yaml.YAMLToJSON(data)
	if err != nil {
		return nil, fmt.Errorf("error converting YAML to JSON: %w", err)
	}

	var c Config
	if err := protojson.Unmarshal(data, &c); err != nil {
		return nil, err
	}

	return &c, nil
}
