package local

import (
	"regexp"

	"github.com/unstoppablemango/ux/pkg/config"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/registry"
	"github.com/unstoppablemango/ux/pkg/plugin/registry/internal"
)

var (
	BinPattern = regexp.MustCompile(`(.+2.+)|(ux-.+)`)
	UserConfig = registry.IgnoreNotFound(Directory(config.PluginDir))

	Default plugin.Registry = internal.Aggregate{UserConfig}
)
