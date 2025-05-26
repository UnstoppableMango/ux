package plugin

import (
	"context"
	"net"
	"os"
	"path/filepath"
	"time"

	"github.com/charmbracelet/log"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/ux"
	"google.golang.org/grpc"
)

type Ux struct {
	Receiver
	plugin ux.Plugin
}

func New(p ux.Plugin) Ux {
	return Ux{plugin: p}
}

// Generate implements Ux.
func (u *Ux) Generate(ctx context.Context, input *uxv1alpha1.Payload) (*uxv1alpha1.Payload, error) {
	sock, err := u.listen(ctx)
	if err != nil {
		return nil, err
	}

	if err = u.plugin.Invoke(ctx, sock); err != nil {
		return nil, err
	}

	ctx, cancel := context.WithTimeout(ctx, 1*time.Second)
	defer cancel()

	return nil, nil
}

func (u *Ux) listen(ctx context.Context) (string, error) {
	tmp, err := os.MkdirTemp("", "")
	if err != nil {
		return "", err
	}

	sock := filepath.Join(tmp, "ux.sock")
	lis, err := net.Listen("unix", "unix://"+sock)
	if err != nil {
		return "", err
	}

	server := grpc.NewServer()
	uxv1alpha1.RegisterPluginServiceServer(server, u)

	_ = context.AfterFunc(ctx, server.GracefulStop)
	go u.serve(server, lis)

	return sock, nil
}

func (u *Ux) serve(server *grpc.Server, lis net.Listener) {
	if err := server.Serve(lis); err != nil {
		log.Warn(err)
	}
}
