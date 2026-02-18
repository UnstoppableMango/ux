package main_test

import (
	"archive/tar"
	"io/fs"
	"os"
	"os/exec"
	"path/filepath"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	"github.com/onsi/gomega/gexec"
)

var _ = Describe("E2e", func() {
	Describe("Simple", func() {
		var tmp string

		BeforeEach(func() {
			tmp = GinkgoT().TempDir()
			simple, err := fs.Sub(testdata, "testdata/simple")
			Expect(err).NotTo(HaveOccurred())
			Expect(os.CopyFS(tmp, simple)).To(Succeed())
		})

		It("should work", func() {
			cmd := exec.Command(uxBin)
			cmd.Dir = tmp

			ses, err := gexec.Start(cmd, GinkgoWriter, GinkgoWriter)

			Expect(err).NotTo(HaveOccurred())
			Eventually(ses).Should(gexec.Exit(0))
			tarPath := filepath.Join(tmp, "echo.tar")
			Expect(tarPath).To(BeARegularFile())
			file, err := os.Open(tarPath)
			Expect(err).NotTo(HaveOccurred())
			defer file.Close()
			tr := tar.NewReader(file)
			hdr, err := tr.Next()
			Expect(err).NotTo(HaveOccurred())
			Expect(hdr.Name).To(Equal("out.txt"))
		})
	})
})
