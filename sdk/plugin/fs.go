package plugin

import (
	"github.com/spf13/afero"
	protofsv1alpha1 "github.com/unmango/aferox/protofs/grpc/v1alpha1"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
)

type FsInjector interface {
	InjectFs(afero.Fs)
}

type WithFs struct {
	Fs afero.Fs
}

func (target *WithFs) InjectFs(fs afero.Fs) {
	target.Fs = fs
}

func OutputFs(req *uxv1alpha1.GenerateRequest) (afero.Fs, error) {
	conn, err := grpc.NewClient(req.FsAddress,
		grpc.WithTransportCredentials(insecure.NewCredentials()),
	)
	if err != nil {
		return nil, err
	}

	return protofsv1alpha1.NewFs(conn), nil
}
