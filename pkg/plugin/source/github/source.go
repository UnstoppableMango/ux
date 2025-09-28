package github

import (
	"archive/tar"
	"compress/gzip"
	"context"
	"fmt"
	"io"
	"net/http"
	"path/filepath"

	"github.com/google/go-github/v75/github"
	"github.com/spf13/afero"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/cli"
)

type asset struct {
	fs          afero.Fs
	client      *github.Client
	owner, repo string
	asset       *github.ReleaseAsset
}

// Load implements plugin.Source.
func (g *asset) Load(ctx context.Context) (ux.Plugin, error) {
	r, _, err := g.client.Repositories.DownloadReleaseAsset(ctx,
		g.owner,
		g.repo,
		g.asset.GetID(),
		http.DefaultClient,
	)
	if err != nil {
		return nil, err
	}
	defer r.Close()

	fs := afero.NewOsFs()
	tmp, err := afero.TempDir(fs, "", "")
	if err != nil {
		return nil, err
	}

	name := g.asset.GetName()
	path := filepath.Join(tmp, name)

	switch filepath.Ext(name) {
	case ".tar.gz":
		return writeTarGz(fs, path, r) // TODO
	case ".tar":
		return writeTar(fs, path, tar.NewReader(r))
	default:
		return writeBin(fs, path, r)
	}
}

func Asset(
	client *github.Client,
	owner, repo string,
	releaseAsset *github.ReleaseAsset,
) (plugin.Source, error) {
	if !plugin.BinPattern.MatchString(releaseAsset.GetName()) {
		return nil, fmt.Errorf("release %s does not match %s", releaseAsset.GetName(), plugin.BinPattern)
	}

	return &asset{
		fs:     afero.NewOsFs(),
		client: client,
		owner:  owner,
		repo:   repo,
		asset:  releaseAsset,
	}, nil
}

func writeTarGz(fs afero.Fs, path string, r io.Reader) (ux.Plugin, error) {
	if gzip, err := gzip.NewReader(r); err != nil {
		return nil, err
	} else {
		return writeTar(fs, path, tar.NewReader(gzip))
	}
}

func writeTar(fs afero.Fs, path string, r *tar.Reader) (ux.Plugin, error) {
	if h, err := r.Next(); err != nil {
		return nil, err
	} else {
		return writeBin(fs, path, r) // TODO
	}
}

func writeBin(fs afero.Fs, path string, r io.Reader) (ux.Plugin, error) {
	if err := afero.WriteReader(fs, path, r); err != nil {
		return nil, err
	} else {
		return cli.Plugin(path), nil
	}
}
