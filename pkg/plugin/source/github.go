package source

import (
	"context"
	"fmt"

	"github.com/google/go-github/v78/github"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/plugin"
)

type githubRelease struct {
	client  *github.Client
	release *github.RepositoryRelease
}

// Load implements plugin.Source.
func (g *githubRelease) Load(context.Context) (ux.Plugin, error) {
	panic("unimplemented")
}

func GitHubRelease(client *github.Client, release *github.RepositoryRelease) (plugin.Source, error) {
	if !plugin.BinPattern.MatchString(release.GetName()) {
		return nil, fmt.Errorf("release %s does not match %s", release.GetName(), plugin.BinPattern)
	}

	return &githubRelease{client, release}, nil
}
