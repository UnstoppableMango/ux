package registry

import (
	"github.com/unstoppablemango/ux/pkg/config"
	"github.com/unstoppablemango/ux/pkg/plugin/registry/local"
)

var (
	CwdBin     = IgnoreNotFound(local.Cwd.Join("bin"))
	LocalBin   = IgnoreNotFound(local.Directory(config.LocalBin))
	UserConfig = IgnoreNotFound(local.Directory(config.PluginDir))

	Default = Aggregate{CwdBin, LocalBin, UserConfig}
)

type Local interface {
	Path() string
}
