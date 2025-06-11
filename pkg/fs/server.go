package fs

import (
	"context"
	"net"
	"path/filepath"

	"github.com/spf13/afero"
	protofsv1alpha1 "github.com/unmango/aferox/protofs/grpc/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/os"
	"github.com/unstoppablemango/ux/pkg/os/fs"
	"google.golang.org/grpc"
)

func Listen(ctx context.Context) (net.Listener, error) {
	if sock, err := Socket(ctx, ""); err != nil {
		return nil, err
	} else {
		return net.Listen("unix", sock)
	}
}

func ListenAndServe(ctx context.Context, fs afero.Fs) error {
	if lis, err := Listen(ctx); err != nil {
		return err
	} else {
		return Serve(lis, fs)
	}
}

func NewServer(source afero.Fs) *grpc.Server {
	srv := grpc.NewServer()
	protofsv1alpha1.RegisterFsServer(srv, source)
	return srv
}

func Serve(lis net.Listener, fs afero.Fs) error {
	return NewServer(fs).Serve(lis)
}

func Socket(ctx context.Context, prefix string) (string, error) {
	os := os.FromContext(ctx)
	if tmp, err := fs.TempDir(os, prefix); err != nil {
		return "", err
	} else {
		return filepath.Join(tmp, "ux.sock"), nil
	}
}
