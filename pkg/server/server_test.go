package server_test

import (
	"context"
	"fmt"
	"io"
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
	var s *server.Server

	BeforeEach(func() {
		s = server.New()
	})

	It("should error when name is not provided", func(ctx context.Context) {
		_, err := s.Write(ctx, &uxv1alpha1.WriteRequest{})

		Expect(err).To(MatchError("no name in request"))
	})

	It("should write data", func(ctx context.Context) {
		_, err := s.Write(ctx, &uxv1alpha1.WriteRequest{
			Name: ptr.To("test"),
			Data: []byte("testing"),
		})

		Expect(err).NotTo(HaveOccurred())
		r, err := s.Output("test")
		Expect(err).NotTo(HaveOccurred())
		data, err := io.ReadAll(r)
		Expect(err).NotTo(HaveOccurred())
		Expect(string(data)).To(Equal("testing"))
	})

	Describe("E2E", func() {
		var (
			srv *server.Server
			client uxv1alpha1.UxServiceClient
		)

		BeforeEach(func() {
			tmp := GinkgoT().TempDir()
			sock := filepath.Join(tmp, "ux.sock")
			lis, err := net.Listen("unix", sock)
			Expect(err).NotTo(HaveOccurred())

			srv = server.New()

			go func() {
				_ = srv.Serve(lis)
			}()

			conn, err := grpc.NewClient(fmt.Sprint("unix://", sock),
				grpc.WithTransportCredentials(insecure.NewCredentials()),
			)
			Expect(err).NotTo(HaveOccurred())
			client = uxv1alpha1.NewUxServiceClient(conn)
		})

		It("should write data", func(ctx context.Context) {
			_, err := client.Write(ctx, &uxv1alpha1.WriteRequest{
				Name: ptr.To("test"),
				Data: []byte("testing"),
			})

			Expect(err).NotTo(HaveOccurred())
			r, err := srv.Output("test")
			Expect(err).NotTo(HaveOccurred())
			data, err := io.ReadAll(r)
			Expect(err).NotTo(HaveOccurred())
			Expect(string(data)).To(Equal("testing"))
		})
	})
})
