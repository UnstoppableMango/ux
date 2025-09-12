package registry

import (
	"os"
	"path/filepath"
	"slices"

	"github.com/charmbracelet/log"
	"github.com/unmango/go/iter"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/source"
)

var (
	Default plugin.Registry = Compact(Aggregate(
		Must(FromEnv("PATH")),
		Must(CwdBin()),
	))
)

func CwdBin() (plugin.Registry, error) {
	if wd, err := os.Getwd(); err != nil {
		return nil, err
	} else {
		return LocalDir(filepath.Join(wd, "bin"))
	}
}

func LocalDir(dir string) (plugin.Registry, error) {
	if entries, err := os.ReadDir(dir); err != nil {
		return nil, err
	} else {
		return dirEntries{dir, entries}, nil
	}
}

type dirEntries struct {
	root    string
	entries []os.DirEntry
}

func (d dirEntries) List() iter.Seq[plugin.Source] {
	return func(yield func(plugin.Source) bool) {
		for _, e := range d.entries {
			if s, err := source.FromDirEntry(d.root, e); err != nil {
				log.Debug("Skipping entry", "err", err)
			} else if !yield(s) {
				return
			}
		}
	}
}

func FromEnv(name string) (plugin.Registry, error) {
	var sources []plugin.Registry
	for _, dir := range filepath.SplitList(os.Getenv(name)) {
		if s, err := LocalDir(dir); err != nil {
			return nil, err
		} else {
			sources = append(sources, s)
		}
	}

	return aggregate(sources), nil
}

type aggregate []plugin.Registry

// List implements plugin.Source.
func (a aggregate) List() iter.Seq[plugin.Source] {
	return iter.Bind(slices.Values(a), ListSources)
}

func Aggregate(sources ...plugin.Registry) plugin.Registry {
	return aggregate(sources)
}

func Append(source plugin.Registry, elem ...plugin.Registry) plugin.Registry {
	if agg, ok := source.(aggregate); ok {
		return aggregate(append(agg, elem...))
	} else {
		return aggregate(append(elem, source))
	}
}

func Must(registry plugin.Registry, err error) plugin.Registry {
	if err != nil {
		panic(err)
	} else {
		return registry
	}
}

func ListSources(r plugin.Registry) iter.Seq[plugin.Source] {
	return r.List()
}

type compact struct {
	src plugin.Registry
}

func (r compact) List() iter.Seq[plugin.Source] {
	// TODO: wtf
	return slices.Values(slices.Compact(slices.Collect(r.src.List())))
}

func Compact(registry plugin.Registry) plugin.Registry {
	return compact{registry}
}
