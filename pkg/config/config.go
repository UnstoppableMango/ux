package config

import (
	"path/filepath"

	"github.com/adrg/xdg"
	ux "github.com/unstoppablemango/ux/pkg"
)

const (
	Project     = "ux"
	DefaultName = ".config"
	DefaultType = "yaml"
	DefaultFile = DefaultName + "." + DefaultType
)

var (
	DefaultDir  = filepath.Join(xdg.ConfigHome, Project)
	DefaultPath = filepath.Join(DefaultDir, DefaultFile)
	PluginDir   = filepath.Join(DefaultDir, "plugins")
	LocalBin    = xdg.BinHome
)

type Config interface{}

type Option struct {
	name    string
	aliases []string
}

func (o *Option) Configure(opt ux.Option) {
	opt.Name(o.name)
	for _, alias := range o.aliases {
		opt.Alias(alias)
	}
}

func (o *Option) Name(value string) {
	o.name = value
}

func (o *Option) Alias(value string) {
	o.aliases = append(o.aliases, value)
}

type Builder struct {
	options map[string]*Option
}

func (ux *Builder) Input(configure ux.Configure) {
	o := &Option{}
	configure.Configure(o)
}

type all []ux.Configure

func (cs all) Configure(o ux.Option) {
	for _, c := range cs {
		c.Configure(o)
	}
}

func All(configure ...ux.Configure) ux.Configure {
	return all(configure)
}

func Named(b ux.Builder, name string) string {
	return b.Input(&Option{
		name:    name,
		aliases: []string{},
	})
}
