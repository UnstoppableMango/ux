package e2e_test

import (
	"context"
	"os"
	"os/exec"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	"github.com/onsi/gomega/gexec"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/plugin"
)

var _ = Describe("E2e", func() {
	Describe("CLI", func() {
		It("should execute", func() {
			cmd := exec.Command(uxPath)

			ses := Run(cmd)

			Eventually(ses).Should(gexec.Exit(0))
		})
	})

	Describe("Dummy", func() {
		It("should return capabilities", func(ctx context.Context) {
			p := plugin.LocalBinary(dummyPath)

			res, err := p.Capabilities(ctx, &uxv1alpha1.CapabilitiesRequest{})

			Expect(err).NotTo(HaveOccurred())
			Expect(res.All).To(ContainElement(SatisfyAll(
				HaveField("From", "dummyA"),
				HaveField("To", "dummyB"),
				HaveField("Lossy", true),
			)))
		})

		It("should return capabilities", func(ctx context.Context) {
			p := plugin.LocalBinary(dummyPath)

			res, err := p.Capabilities(ctx, &uxv1alpha1.CapabilitiesRequest{})

			Expect(err).NotTo(HaveOccurred())
			Expect(res.All).To(ContainElement(SatisfyAll(
				HaveField("From", "dummyA"),
				HaveField("To", "dummyB"),
				HaveField("Lossy", true),
			)))
		})
	})

	Describe("Plugin Conformance", func() {
		BeforeEach(func() {
			Expect(os.Setenv("GINKGO_NO_COLOR", "true")).To(Succeed())
		})

		It("should execute", func() {
			cmd := exec.Command(uxPath, "plugin", "conformance", dummyPath)

			ses, err := gexec.Start(cmd, GinkgoWriter, GinkgoWriter)

			Expect(err).NotTo(HaveOccurred())
			Eventually(ses, "30s").Should(gexec.Exit(0))
		})
	})
})
