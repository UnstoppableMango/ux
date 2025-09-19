package e2e_test

import (
	"os/exec"
	"path/filepath"

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

		It("should generate Go code from an OpenAPI spec", func() {
			tmp := GinkgoT().TempDir()
			out := filepath.Join(tmp, "petstore.go")
			CopyTestdata(tmp)

			cmd := exec.Command(uxPath, "gen", "go", "petstore.yml")
			cmd.Dir = tmp

			ses := Run(cmd)

			Eventually(ses).Should(gexec.Exit(0))
			Expect(out).To(BeARegularFile())
		})
	})
})
