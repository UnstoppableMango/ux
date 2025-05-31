package local

import (
	"regexp"

	"github.com/unstoppablemango/ux/pkg/config"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/registry"
)

var (
	BinPattern = regexp.MustCompile(`(.+2.+)|(ux-.+)`)
	UserConfig = registry.IgnoreNotFound(LocalDirectory(config.PluginDir))

	Default plugin.Registry = registry.Aggregate{UserConfig}
)
