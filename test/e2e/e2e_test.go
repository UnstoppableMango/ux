package e2e_test

import (
	"bytes"
	"context"
	"fmt"
	"io"
	"os"
	"os/exec"
	"path/filepath"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	"github.com/onsi/gomega/gexec"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/server"
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
		var (
			srv  *server.Server
			sock string
		)

		BeforeEach(func(ctx context.Context) {
			var err error
			sock, err = server.TempSocket("", "")
			Expect(err).NotTo(HaveOccurred())

			srv = server.New(
				server.WithInput("input.txt", bytes.NewBufferString("testing")),
			)

			go func() {
				By("Serving a ux server")
				_ = srv.ListenAndServe(sock)
			}()
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

		It("should echo back its input", func(ctx context.Context) {
			p := plugin.LocalBinary(dummyPath)
			inputs := []string{"input.txt"}

			res, err := p.Generate(ctx, &uxv1alpha1.GenerateRequest{
				Address: fmt.Sprint("unix://", sock),
				Inputs:  inputs,
			})

			Expect(err).NotTo(HaveOccurred())
			Expect(res.Outputs).To(Equal([]string{"input.txt"}))
			r, err := srv.Output("input.txt")
			Expect(err).NotTo(HaveOccurred())
			data, err := io.ReadAll(r)
			Expect(err).NotTo(HaveOccurred())
			Expect(string(data)).To(Equal("testing"))
		})

		It("should flow through ux", func() {
			tmp := GinkgoT().TempDir()
			inputPath := filepath.Join(tmp, "input.txt")
			f, err := os.Fs().Create(inputPath)
			Expect(err).NotTo(HaveOccurred())
			_, err = io.WriteString(f, "testing")
			Expect(err).NotTo(HaveOccurred())

			cmd := exec.Command(uxPath, "generate", dummyPath, "-v", "-i", inputPath)
			cmd.Dir = tmp

			ses, err := gexec.Start(cmd, GinkgoWriter, GinkgoWriter)

			Expect(err).NotTo(HaveOccurred())
			Eventually(ses).Should(gexec.Exit(0))
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
