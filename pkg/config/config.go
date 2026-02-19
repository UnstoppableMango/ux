package config

import (
	"bytes"
	"fmt"
	"html/template"
	"os/exec"

	"github.com/goccy/go-yaml"
	"github.com/spf13/afero"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"google.golang.org/protobuf/encoding/protojson"
)

type (
	Config  = uxv1alpha1.Config
	Package = uxv1alpha1.Package
	Vars    = uxv1alpha1.Vars
)

func Command(cmd []string, vars *Vars) (*exec.Cmd, error) {
	if result, err := ReplaceVariables(cmd, vars); err != nil {
		return nil, err
	} else {
		return exec.Command(result[0], result[1:]...), nil
	}
}

func Find(fs afero.Fs, wd string) (string, error) {
	matches, err := afero.Glob(fs, "config.y*ml")
	if err != nil {
		return "", err
	}

	if len(matches) == 0 {
		return "", fmt.Errorf("no config file found")
	}

	return matches[0], nil
}

func Read(fs afero.Fs, file string) (*Config, error) {
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

func ReplaceVariables(parts []string, vars *Vars) ([]string, error) {
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

func Template(v string, vars *Vars) (string, error) {
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
