package e2e_test

import (
	"os"
	"os/exec"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	"github.com/onsi/gomega/gexec"
)

var _ = Describe("E2e", func() {
	Describe("CLI", func() {
		It("should execute", func() {
			cmd := exec.Command(uxPath)

			ses := Run(cmd)

			Eventually(ses).Should(gexec.Exit(0))
		})
	})

	Describe("Conformance", func() {
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
