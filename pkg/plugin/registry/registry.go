package registry

import (
	"errors"
	"fmt"
	"os"
	"path/filepath"
	"slices"

	"github.com/charmbracelet/log"
	"github.com/unmango/go/iter"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/source"
)

var (
	Default = Compact(Aggregate(
		FromEnv("PATH"),
		CwdBin(),
		LocalFile("dummy"),
	))

	Empty plugin.Registry = aggregate{}
)

func CwdBin() plugin.Registry {
	if wd, err := os.Getwd(); err != nil {
		return Error(err)
	} else {
		return LocalDir(filepath.Join(wd, "bin"))
	}
}

func LocalDir(dir string) plugin.Registry {
	if entries, err := os.ReadDir(dir); err != nil {
		return Error(err)
	} else {
		return dirEntries{dir, entries}
	}
}

func Error(err error) plugin.Registry {
	return errored{err}
}

type errored struct{ error }

// List implements plugin.Registry.
func (errored) List() iter.Seq[plugin.Source] {
	return iter.Empty[plugin.Source]()
}

type withErr struct {
	reg plugin.Registry
	err error
}

func (w withErr) Equal(reg plugin.Registry) bool {
	return w.reg == reg
}

func (w withErr) String() string {
	return fmt.Sprintf("%#v", w)
}

// List implements plugin.Registry.
func (w withErr) List() iter.Seq[plugin.Source] {
	return w.reg.List()
}

func WithErr(registry plugin.Registry, err error) plugin.Registry {
	if hasErr, ok := registry.(withErr); ok {
		err = errors.Join(err, hasErr.err)
	}

	return withErr{registry, err}
}

func LocalFile(path string) plugin.Registry {
	return Singleton(source.LocalFile(path))
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

func FromEnv(name string) plugin.Registry {
	var sources []plugin.Registry
	for _, dir := range filepath.SplitList(os.Getenv(name)) {
		sources = append(sources, LocalDir(dir))
	}

	return aggregate(sources)
}

type aggregate []plugin.Registry

// List implements plugin.Registry.
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

type singleton struct{ plugin.Source }

func Singleton(source plugin.Source) plugin.Registry {
	return singleton{source}
}

// List implements plugin.Registry.
func (a singleton) List() iter.Seq[plugin.Source] {
	return iter.Singleton[plugin.Source](a)
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
