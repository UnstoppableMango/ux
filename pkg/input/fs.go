package input

import (
	"context"
	"fmt"
	"io"
	"maps"
	"os"
	"sync"

	"github.com/charmbracelet/log"
	"github.com/spf13/afero"
	"github.com/unmango/aferox"
	ux "github.com/unstoppablemango/ux/pkg"
)

type Fs struct {
	aferox.ReadOnlyFs

	sources map[string]ux.Source
	sinks   map[string]ux.Sink
}

func NewFs(input ux.Input) afero.Fs {
	return &Fs{
		sources: maps.Collect(input.Sources()),
		sinks:   maps.Collect(input.Sinks()),
	}
}

func (fs *Fs) Name() string {
	return "Input"
}

func (fs *Fs) Open(name string) (afero.File, error) {
	log.Infof("Attempting to open: %s, sources: %s", name, fs.sources)
	if s, ok := fs.sources[name]; ok {
		log.Info("Successfully opened")
		return NewSourceFile(name, s), nil
	} else {
		return nil, fmt.Errorf("not found: %s", name)
	}
}

// OpenFile implements afero.Fs.
func (fs *Fs) OpenFile(name string, flag int, perm os.FileMode) (afero.File, error) {
	if s, ok := fs.sources[name]; ok { // TODO: maybe flag and perm stuff
		return NewSourceFile(name, s), nil
	} else {
		return nil, fmt.Errorf("not found: %s", name)
	}
}

// Stat implements afero.Fs.
func (fs *Fs) Stat(name string) (os.FileInfo, error) {
	if source, ok := fs.sources[name]; ok {
		if s, ok := source.(os.FileInfo); ok {
			return s, nil
		} else {
			return nil, fmt.Errorf("stat not supported: %v", source)
		}
	}

	return nil, fmt.Errorf("input %v does not contain source: %s", fs.sources, name)
}

type SourceFile struct {
	aferox.ReadOnlyFile

	name   string
	source ux.Source
	open   func() (io.Reader, error)
}

func NewSourceFile(name string, source ux.Source) *SourceFile {
	return &SourceFile{
		name:   name,
		source: source,
		open: sync.OnceValues(func() (io.Reader, error) {
			return source.Open(context.TODO())
		}),
	}
}

// Close implements afero.File.
func (s SourceFile) Close() error {
	r, err := s.open()
	if err != nil {
		return nil
	}

	if c, ok := r.(io.Closer); ok {
		return c.Close()
	} else {
		return nil
	}
}

// Name implements afero.File.
func (s SourceFile) Name() string { return s.name }

// Read implements afero.File.
func (s SourceFile) Read(p []byte) (n int, err error) {
	if r, err := s.open(); err != nil {
		return 0, err
	} else {
		return r.Read(p)
	}
}

// ReadAt implements afero.File.
func (s SourceFile) ReadAt(p []byte, off int64) (n int, err error) {
	r, err := s.open()
	if err != nil {
		return 0, err
	}

	if rat, ok := r.(io.ReaderAt); ok {
		return rat.ReadAt(p, off)
	} else {
		return 0, fmt.Errorf("source does not support offsets: %v", r)
	}
}

// Stat implements afero.File.
func (s SourceFile) Stat() (os.FileInfo, error) {
	if fi, ok := s.source.(os.FileInfo); ok {
		return fi, nil
	} else {
		return nil, fmt.Errorf("source does not support stat: %v", s.source)
	}
}
