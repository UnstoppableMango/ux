package registry

import (
	"os"
	"path/filepath"
	"slices"

	"github.com/unmango/go/iter"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/source"
)

var (
	Default = Compact(Merge(
		EnvList("PATH"),
		CwdBin(),
		Cli("dummy"),
	))

	Empty plugin.Registry = aggregate{}
)

func CwdBin() plugin.Registry {
	if wd, err := os.Getwd(); err != nil {
		return Errored(err)
	} else {
		return LocalDir(filepath.Join(wd, "bin"))
	}
}

func LocalDir(dir string) plugin.Registry {
	if entries, err := os.ReadDir(dir); err != nil {
		return Errored(err)
	} else {
		return dirEntries{dir, entries}
	}
}

func Errored(err error) plugin.Registry {
	return errored{err}
}

type errored struct{ error }

// Sources implements plugin.Registry.
func (errored) Sources() iter.Seq[plugin.Source] {
	return iter.Empty[plugin.Source]()
}

func Cli(path string) plugin.Registry {
	return Source(source.Cli(path))
}

type dirEntries struct {
	root    string
	entries []os.DirEntry
}

func (d dirEntries) Sources() iter.Seq[plugin.Source] {
	return iter.Map(d.Entries(), d.Source)
}

func (d dirEntries) Source(e os.DirEntry) plugin.Source {
	return source.DirEntry(d.root, e)
}

func (d dirEntries) Entries() iter.Seq[os.DirEntry] {
	return slices.Values(d.entries)
}

func EnvList(name string) plugin.Registry {
	var sources []plugin.Registry
	for _, dir := range filepath.SplitList(os.Getenv(name)) {
		sources = append(sources, LocalDir(dir))
	}

	return aggregate(sources)
}

type aggregate []plugin.Registry

// Sources implements plugin.Registry.
func (a aggregate) Sources() iter.Seq[plugin.Source] {
	return iter.Bind(slices.Values(a), ListSources)
}

func Merge(registries ...plugin.Registry) plugin.Registry {
	return aggregate(registries)
}

func Append(source plugin.Registry, elem ...plugin.Registry) plugin.Registry {
	if agg, ok := source.(aggregate); ok {
		return aggregate(append(agg, elem...))
	} else {
		return aggregate(append(elem, source))
	}
}

type singleton struct{ plugin.Source }

func Source(source plugin.Source) plugin.Registry {
	return singleton{source}
}

// Sources implements plugin.Registry.
func (a singleton) Sources() iter.Seq[plugin.Source] {
	return iter.Singleton[plugin.Source](a)
}

func Must(registry plugin.Registry, err error) plugin.Registry {
	if err != nil {
		panic(err)
	} else {
		return registry
	}
}

// ListSources is an aesthetic wrapper around r.Sources()
func ListSources(r plugin.Registry) iter.Seq[plugin.Source] {
	return r.Sources()
}

type compact struct {
	src plugin.Registry
}

func (r compact) Sources() iter.Seq[plugin.Source] {
	return iter.Compact(r.src.Sources())
}

func Compact(registry plugin.Registry) plugin.Registry {
	return compact{registry}
}
