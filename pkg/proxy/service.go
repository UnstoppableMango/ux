package proxy

import (
	"context"
	"net"

	"github.com/charmbracelet/log"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"google.golang.org/grpc"
)

type Service struct {
	uxv1alpha1.UnimplementedUxServiceServer

	acknowledge mailbox[*uxv1alpha1.AcknowledgeRequest, *uxv1alpha1.AcknowledgeResponse]
	complete    mailbox[*uxv1alpha1.CompleteRequest, *uxv1alpha1.CompleteResponse]
}

func (p *Service) Acknowledge(ctx context.Context, req *uxv1alpha1.AcknowledgeRequest) (*uxv1alpha1.AcknowledgeResponse, error) {
	return p.acknowledge.receive(ctx, req)
}

func (p *Service) Complete(ctx context.Context, req *uxv1alpha1.CompleteRequest) (*uxv1alpha1.CompleteResponse, error) {
	return p.complete.receive(ctx, req)
}

func Start(ctx context.Context, host string) (*Service, error) {
	lis, err := net.Listen("unix", host)
	if err != nil {
		return nil, err
	}

	svc := &Service{
		acknowledge: mailbox[*uxv1alpha1.AcknowledgeRequest, *uxv1alpha1.AcknowledgeResponse]{
			in:  make(chan *uxv1alpha1.AcknowledgeRequest),
			out: make(chan *uxv1alpha1.AcknowledgeResponse),
		},
		complete: mailbox[*uxv1alpha1.CompleteRequest, *uxv1alpha1.CompleteResponse]{
			in:  make(chan *uxv1alpha1.CompleteRequest),
			out: make(chan *uxv1alpha1.CompleteResponse),
		},
	}

	server := grpc.NewServer()
	uxv1alpha1.RegisterUxServiceServer(server, svc)

	_ = context.AfterFunc(ctx, server.GracefulStop)
	go serve(server, lis)

	return svc, nil
}

func serve(server *grpc.Server, lis net.Listener) {
	if err := server.Serve(lis); err != nil {
		log.Warn(err)
	}
}
