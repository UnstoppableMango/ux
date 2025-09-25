package source

import (
	"context"
	"fmt"
	"net/http"

	"github.com/google/go-github/v78/github"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/plugin"
)

type githubAsset struct {
	client      *github.Client
	owner, repo string
	asset       *github.ReleaseAsset
}

// Load implements plugin.Source.
func (g *githubAsset) Load(ctx context.Context) (ux.Plugin, error) {
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

	return reader{r}.Load(ctx)
}

func Asset(
	client *github.Client,
	owner, repo string,
	asset *github.ReleaseAsset,
) (plugin.Source, error) {
	if !plugin.BinPattern.MatchString(asset.GetName()) {
		return nil, fmt.Errorf("release %s does not match %s", asset.GetName(), plugin.BinPattern)
	}

	return &githubAsset{
		client: client,
		owner:  owner,
		repo:   repo,
		asset:  asset,
	}, nil
}
