package registry

import (
	"github.com/unstoppablemango/ux/pkg/config"
	"github.com/unstoppablemango/ux/pkg/plugin/registry/builder"
	"github.com/unstoppablemango/ux/pkg/plugin/registry/local"
)

var common = builder.From(IgnoreNotFound)

var (
	CwdBin     = common.Apply(local.Cwd.Join("bin"))
	LocalBin   = common.Apply(local.Directory(config.LocalBin))
	UserConfig = common.Apply(local.Directory(config.PluginDir))

	Default = Aggregate{CwdBin, LocalBin, UserConfig}
)

type Local interface {
	Path() string
}
