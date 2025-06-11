package fs

import (
	"context"

	fsv1alpha1 "buf.build/gen/go/unmango/protofs/grpc/go/dev/unmango/fs/v1alpha1/fsv1alpha1grpc"
	"github.com/spf13/afero"
	protofsv1alpha1 "github.com/unmango/aferox/protofs/grpc/v1alpha1"
)

func Serve(ctx context.Context, source afero.Fs) (fsv1alpha1.FsServiceServer, error) {
	fs := &protofsv1alpha1.FsServer{}
	return fs, nil
}
