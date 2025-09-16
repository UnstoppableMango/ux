package registry

import (
	"context"

	"github.com/charmbracelet/log"
	"github.com/google/go-github/v74/github"
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

func (g githubRepo) List() iter.Seq[plugin.Source] {
	ctx := context.TODO()
	releases, _, err := g.listReleases(ctx)
	if err != nil {
		// TODO: This whole thing is a terrible idea
		log.Error("Failed to list releases", "err", err)
		return iter.Empty[plugin.Source]()
	}

	return func(yield func(plugin.Source) bool) {
		for _, rel := range releases {
			if gh, err := source.GitHubRelease(g.client, rel); err != nil {
				log.Debug("Skipping GitHub Release", "err", err)
			} else if !yield(gh) {
				return
			}
		}
	}
}

func (g githubRepo) listReleases(ctx context.Context) ([]*github.RepositoryRelease, *github.Response, error) {
	return g.client.Repositories.ListReleases(ctx, g.owner, g.repo, nil)
}
