package github

import (
	"context"

	"github.com/charmbracelet/log"
	"github.com/google/go-github/v75/github"
	"github.com/unmango/go/iter"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/source"
)

type githubRepo struct {
	client      *github.Client
	owner, repo string
}

func Repository(client *github.Client, owner, repo string) plugin.Registry {
	return &githubRepo{client, owner, repo}
}

func (g githubRepo) Sources() iter.Seq[plugin.Source] {
	return func(yield func(plugin.Source) bool) {
		if releases, _, err := g.listReleases(context.TODO()); err != nil {
			log.Error("Failed to list releases", "err", err)
		} else {
			for _, rel := range releases {
				g.sources(rel)(yield)
			}
		}
	}
}

func (g githubRepo) sources(r *github.RepositoryRelease) iter.Seq[plugin.Source] {
	return GitHubRelease(g.client, g.owner, g.repo, r).Sources()
}

func (g githubRepo) listReleases(ctx context.Context) ([]*github.RepositoryRelease, *github.Response, error) {
	return g.client.Repositories.ListReleases(ctx, g.owner, g.repo, nil)
}

type githubRelease struct {
	client      *github.Client
	owner, repo string
	release     *github.RepositoryRelease
}

func GitHubRelease(client *github.Client, owner, repo string, release *github.RepositoryRelease) plugin.Registry {
	return &githubRelease{client, owner, repo, release}
}

func (g githubRelease) Sources() iter.Seq[plugin.Source] {
	return func(yield func(plugin.Source) bool) {
		if assets, _, err := g.listAssets(context.TODO()); err != nil {
			log.Error("Failed to list releases", "err", err)
		} else {
			for _, asset := range assets {
				if gh, err := g.source(asset); err != nil {
					log.Debug("Skipping GitHub Asset", "err", err)
				} else if !yield(gh) {
					return
				}
			}
		}
	}
}

func (g githubRelease) source(asset *github.ReleaseAsset) (plugin.Source, error) {
	return source.Asset(g.client, g.owner, g.repo, asset)
}

func (g githubRelease) listAssets(ctx context.Context) ([]*github.ReleaseAsset, *github.Response, error) {
	return g.client.Repositories.ListReleaseAssets(ctx, g.owner, g.repo, g.release.GetID(), nil)
}
