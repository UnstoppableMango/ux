package util

import (
	"io"
	"net/http"
	"os"
	"path/filepath"
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
