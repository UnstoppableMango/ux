package registry

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

func GitHub(client *github.Client, owner, repo string) plugin.Registry {
	return &githubRepo{client, owner, repo}
}

func (g githubRepo) Sources() iter.Seq[plugin.Source] {
	return func(yield func(plugin.Source) bool) {
		if releases, _, err := g.listReleases(context.TODO()); err != nil {
			log.Error("Failed to list releases", "err", err)
		} else {
			for _, rel := range releases {
				if gh, err := source.GitHubRelease(g.client, rel); err != nil {
					log.Debug("Skipping GitHub Release", "err", err)
				} else if !yield(gh) {
					return
				}
			}
		}
	}
}

func (g githubRepo) listReleases(ctx context.Context) ([]*github.RepositoryRelease, *github.Response, error) {
	return g.client.Repositories.ListReleases(ctx, g.owner, g.repo, nil)
}
