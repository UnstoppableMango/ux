package util

import (
	"bytes"
	"context"
	"fmt"
	"io"
	"net/http"
	"os"
	"os/exec"
	"path/filepath"

	"github.com/unmango/go/vcs/git"
)

const petstoreUrl = "https://raw.githubusercontent.com/readmeio/oas/refs/heads/main/packages/oas-examples/3.1/yaml/petstore.yaml"

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

func BuildCsharpDummy(ctx context.Context) (string, error) {
	root, err := git.Root(ctx)
	if err != nil {
		return "", err
	}

	tmp, err := os.MkdirTemp("", "")
	if err != nil {
		return "", err
	}

	dummyPath := filepath.Join(root, "examples/csharp/Dummy")
	cmd := exec.CommandContext(ctx,
		"dotnet", "build", dummyPath,
		"--self-contained",
		"--output", tmp,
	)

	stdout, stderr := &bytes.Buffer{}, &bytes.Buffer{}
	cmd.Stdout, cmd.Stderr = stdout, stderr

	if err := cmd.Run(); err != nil {
		return "", fmt.Errorf("%w: %s", err, stderr)
	}

	return filepath.Join(tmp, "Dummy"), nil
}
