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
	bin, err := binReader(path, r)
	if err != nil {
		return nil, err
	}
	if err := afero.WriteReader(g.fs, path, bin); err != nil {
		return nil, err
	}

	return cli.Plugin(path), nil
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

func binReader(name string, r io.Reader) (io.Reader, error) {
	switch filepath.Ext(name) {
	case ".tar.gz":
		if r, err := gzip.NewReader(r); err != nil {
			return nil, err
		} else {
			// TODO: Find the matching header
			return tar.NewReader(r), nil
		}
	case ".tar":
		return tar.NewReader(r), nil
	default:
		return r, nil
	}
}
