package conformance

import (
	"net"
	"os/exec"
	"path/filepath"

	. "github.com/onsi/ginkgo/v2" //nolint:staticcheck
	. "github.com/onsi/gomega"    //nolint:staticcheck
	"github.com/onsi/gomega/gexec"
	"google.golang.org/grpc"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
)

type SuiteOptions struct {
	Plugin string
}

func NewSuite(opts SuiteOptions) bool {
	return Describe("Conformance", func() {
		var (
			plugin *PluginService
			sock   string
		)

		BeforeEach(func() {
			server := grpc.NewServer()
			plugin = &PluginService{Requests: []*uxv1alpha1.AcknowledgeRequest{}}
			uxv1alpha1.RegisterPluginServiceServer(server, plugin)

			sock = filepath.Join(GinkgoT().TempDir(), "ux.sock")
			lis, err := net.Listen("unix", sock)
			Expect(err).NotTo(HaveOccurred())

			By("Starting the plugin server")
			DeferCleanup(server.Stop)
			go func() {
				_ = server.Serve(lis)
			}()
		})

		It("should work", func() {
			cmd := exec.Command(opts.Plugin, "unix://"+sock)
			ses, err := gexec.Start(cmd, GinkgoWriter, GinkgoWriter)
			Expect(err).NotTo(HaveOccurred())

			Eventually(func(g Gomega) {
				g.Expect(plugin.Requests).NotTo(BeEmpty())
			}).Should(Succeed())

			req := &uxv1alpha1.AcknowledgeRequest{}
			Expect(plugin.Requests).To(ContainElement(
				HaveField("Name", "dummy"), &req,
			))

			Eventually(ses).Should(gexec.Exit(0))
		})
	})
}
