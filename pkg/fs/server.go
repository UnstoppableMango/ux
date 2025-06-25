package fs

import (
	"net"
	"path/filepath"

	"github.com/spf13/afero"
	protofsv1alpha1 "github.com/unmango/aferox/protofs/grpc/v1alpha1"
	"google.golang.org/grpc"
)

type Server struct {
	grpc        *grpc.Server
	fs          afero.Fs
	Dir, Prefix string
}

func (s *Server) GracefulStop() {
	s.grpc.GracefulStop()
}

func (s *Server) Serve(lis net.Listener) error {
	return s.grpc.Serve(lis)
}

func (s *Server) Listen(socketfs afero.Fs) (net.Listener, error) {
	if sock, err := TempSocket(socketfs, s.Dir, s.Prefix); err != nil {
		return nil, err
	} else {
		return Listen(sock)
	}
}

func Listen(sock string) (net.Listener, error) {
	return net.Listen("unix", sock)
}

func ListenAndServe(fs afero.Fs, sock string) error {
	if lis, err := Listen(sock); err != nil {
		return err
	} else {
		return Serve(lis, fs)
	}
}

func NewServer(fs afero.Fs) *Server {
	srv := grpc.NewServer()
	RegisterServer(srv, fs)

	return &Server{
		grpc: srv,
		fs:   fs,
	}
}

func RegisterServer(s grpc.ServiceRegistrar, source afero.Fs) {
	protofsv1alpha1.RegisterFsServer(s, source)
	protofsv1alpha1.RegisterFileServer(s, source)
}

func Serve(lis net.Listener, fs afero.Fs) error {
	return NewServer(fs).Serve(lis)
}

func TempSocket(fsys afero.Fs, dir, prefix string) (string, error) {
	if tmp, err := afero.TempDir(fsys, dir, prefix); err != nil {
		return "", err
	} else {
		return filepath.Join(tmp, "ux.sock"), nil
	}
}
