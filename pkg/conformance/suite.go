package conformance

import (
	"context"
	"fmt"
	"net"
	"path/filepath"

	. "github.com/onsi/ginkgo/v2" //nolint:staticcheck
	. "github.com/onsi/gomega"    //nolint:staticcheck
	"google.golang.org/grpc"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
)

type SuiteOptions struct {
	Plugin string
}

func NewSuite(opts SuiteOptions) {
	var (
		plugin *PluginService
		server *grpc.Server
	)

	BeforeSuite(func(ctx context.Context) {
		server = grpc.NewServer()

		plugin = &PluginService{Requests: []*uxv1alpha1.RegisterRequest{}}
		uxv1alpha1.RegisterPluginServiceServer(server, plugin)

		sock := filepath.Join(GinkgoT().TempDir(), "ux.sock")
		lis, err := net.Listen("unix", sock)
		Expect(err).NotTo(HaveOccurred())

		By("Starting the plugin server")
		_ = context.AfterFunc(ctx, server.Stop)
		go func() {
			err := server.Serve(lis)
			_, _ = fmt.Fprintf(GinkgoWriter, "Server stopped: %s", err)
		}()
	})

	AfterSuite(func() {
		By("Stopping the plugin server")
		server.Stop()
	})

	Describe("Conformance", func() {
		It("should work", func() {
			Expect(true).To(BeFalse())
		})
	})
}
