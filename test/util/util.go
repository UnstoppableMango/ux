package util

import (
	"bytes"
	"fmt"
	"io"
	"net/http"
	"os"
	"os/exec"
	"path/filepath"
)

const petstoreUrl = "https://raw.githubusercontent.com/readmeio/oas/refs/heads/main/packages/oas-examples/3.1/yaml/petstore.yaml"

// Mimics gexec.CleanupBuildArtifacts() which uses a package-global tmp dir
var tmpDir string

func FetchPetstore() (io.ReadCloser, error) {
	if res, err := http.Get(petstoreUrl); err != nil {
		return nil, err
	} else {
		return res.Body, nil
	}
}

func WritePetstore(dir string) error {
	f, err := os.Create(filepath.Join(dir, "petstore.yml"))
	if err != nil {
		return err
	}

	r, err := FetchPetstore()
	if err != nil {
		return err
	}

	defer func() {
		if err := r.Close(); err != nil {
			panic(err)
		}
	}()

	_, err = io.Copy(f, r)
	return err
}

func BuildCsharpDummy(dummyPath string) (string, error) {
	var err error

	if tmpDir == "" {
		if tmpDir, err = os.MkdirTemp("", ""); err != nil {
			return "", err
		}
	}

	cmd := exec.Command(
		"dotnet", "build", dummyPath,
		"--self-contained",
		"--output", tmpDir,
	)

	stdout, stderr := &bytes.Buffer{}, &bytes.Buffer{}
	cmd.Stdout, cmd.Stderr = stdout, stderr

	if err := cmd.Run(); err != nil {
		return "", fmt.Errorf("%w: %s", err, stderr)
	}

	return filepath.Join(tmpDir, "Dummy"), nil
}

func CleanupCsharpDummy() {
	if tmpDir != "" {
		_ = os.RemoveAll(tmpDir)
	}
}
