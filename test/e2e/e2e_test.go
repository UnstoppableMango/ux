package e2e_test

import (
	"context"
	"fmt"
	"io"
	"os"
	"os/exec"

	filev1alpha1 "buf.build/gen/go/unmango/protofs/protocolbuffers/go/dev/unmango/file/v1alpha1"
	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	"github.com/onsi/gomega/gexec"
	"github.com/spf13/afero"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/fs"
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
		var (
			dummyFs afero.Fs
			sock    string
		)

		BeforeEach(func(ctx context.Context) {
			var err error
			dummyFs = afero.NewMemMapFs()
			sock, err = fs.TempSocket(afero.NewOsFs(), "", "")
			Expect(err).NotTo(HaveOccurred())

			go func() {
				By("Serving a dummy filesystem")
				_ = fs.ListenAndServe(dummyFs, sock)
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
			in, err := dummyFs.Create("input.txt")
			Expect(err).NotTo(HaveOccurred())
			_, err = io.WriteString(in, "testing")
			Expect(err).NotTo(HaveOccurred())
			inputs := []*filev1alpha1.File{{Name: in.Name()}}

			res, err := p.Generate(ctx, &uxv1alpha1.GenerateRequest{
				FsAddress: fmt.Sprint("unix://", sock),
				Inputs:    inputs,
			})

			Expect(err).NotTo(HaveOccurred())
			Expect(res.Outputs).To(Equal([]*filev1alpha1.File{{Name: "output/input.txt"}}))
			out, err := dummyFs.Open("output/input.txt")
			Expect(err).NotTo(HaveOccurred())
			data, err := io.ReadAll(out)
			Expect(err).NotTo(HaveOccurred())
			Expect(string(data)).To(Equal("testing"))
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
