package conformance

import (
	"fmt"
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
			ux   *UxService
			sock string
		)

		BeforeEach(func() {
			server := grpc.NewServer()
			ux = &UxService{
				AcknowledgeEndpoint: endpoint[*uxv1alpha1.AcknowledgeRequest, *uxv1alpha1.AcknowledgeResponse]{},
				CompleteEndpoint:    endpoint[*uxv1alpha1.CompleteRequest, *uxv1alpha1.CompleteResponse]{},
			}
			uxv1alpha1.RegisterUxServiceServer(server, ux)

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
			ux.AcknowledgeEndpoint.Return(&uxv1alpha1.AcknowledgeResponse{
				RequestId: "test-request-id",
			})

			By(fmt.Sprint("Starting the plugin: ", opts.Plugin))
			cmd := exec.Command(opts.Plugin, "unix://"+sock)
			ses, err := gexec.Start(cmd, GinkgoWriter, GinkgoWriter)
			Expect(err).NotTo(HaveOccurred())

			Eventually(func(g Gomega) {
				g.Expect(ux.AcknowledgeEndpoint.Requests).NotTo(BeEmpty())
			}).Should(Succeed())

			req := &uxv1alpha1.AcknowledgeRequest{}
			Expect(ux.AcknowledgeEndpoint.Requests).To(ContainElement(
				HaveField("Name", "dummy"), &req,
			))

			Eventually(func(g Gomega) {
				g.Expect(ux.CompleteEndpoint.Requests).NotTo(BeEmpty())
			}).Should(Succeed())

			Eventually(ses).Should(gexec.Exit(0))
		})
	})
}
