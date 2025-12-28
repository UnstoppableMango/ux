package e2e_test

import (
	"os/exec"
	"path/filepath"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	"github.com/onsi/gomega/gexec"
)

var _ = Describe("Generate", func() {
	It("should generate Go code from an OpenAPI spec", Pending, func() {
		tmp := GinkgoT().TempDir()
		out := filepath.Join(tmp, "petstore.go")
		CopyTestdata(tmp)

		cmd := exec.Command(uxPath, "gen", "go", "petstore.yml")
		cmd.Dir = tmp

		ses := Run(cmd)

		Eventually(ses).Should(gexec.Exit(0))
		Expect(out).To(BeARegularFile())
	})

	It("should generate a gomod2nix.toml file", func() {})
})
