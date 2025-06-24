package server_test

import (
	"context"
	"fmt"
	"net"
	"path/filepath"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
	"k8s.io/utils/ptr"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/server"
)

var _ = Describe("Server", func() {
	var s uxv1alpha1.UxServiceServer

	BeforeEach(func() {
		s = server.New()
	})

	It("should error when name is not provided", func(ctx context.Context) {
		_, err := s.Write(ctx, &uxv1alpha1.WriteRequest{})

		Expect(err).To(MatchError("no name in request"))
	})

	It("should work", func(ctx context.Context) {
		_, err := s.Write(ctx, &uxv1alpha1.WriteRequest{
			Name: ptr.To("test"),
			Data: []byte("test"),
		})

		Expect(err).NotTo(HaveOccurred())
	})

	Describe("E2E", func() {
		var client uxv1alpha1.UxServiceClient

		BeforeEach(func() {
			tmp := GinkgoT().TempDir()
			sock := filepath.Join(tmp, "ux.sock")
			lis, err := net.Listen("unix", sock)
			Expect(err).NotTo(HaveOccurred())

			go func() {
				_ = server.Serve(lis)
			}()

			conn, err := grpc.NewClient(fmt.Sprint("unix://", sock),
				grpc.WithTransportCredentials(insecure.NewCredentials()),
			)
			Expect(err).NotTo(HaveOccurred())
			client = uxv1alpha1.NewUxServiceClient(conn)
		})

		It("should work", func(ctx context.Context) {
			_, err := client.Write(ctx, &uxv1alpha1.WriteRequest{
				Name: ptr.To("test"),
				Data: []byte("test"),
			})

			Expect(err).NotTo(HaveOccurred())
		})
	})
})
