package local_test

import (
	"context"
	"os"
	"path/filepath"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/registry/local"
)

var _ = Describe("Directory", func() {
	Describe("Directory", func() {
		var path string

		BeforeEach(func() {
			cwd, err := os.Getwd()
			Expect(err).NotTo(HaveOccurred())
			path = filepath.Join(cwd, "testdata")
		})

		It("should list plugins", func(ctx context.Context) {
			dir := local.LocalDirectory(path)

			plugins, err := dir.List(ctx)

			Expect(err).NotTo(HaveOccurred())
			Expect(plugins).NotTo(BeEmpty())
			Expect(plugins).To(HaveKeyWithValue("a2b",
				plugin.LocalBinary(filepath.Join(path, "a2b")),
			))
			Expect(plugins).To(HaveKeyWithValue("ux-plugin",
				plugin.LocalBinary(filepath.Join(path, "ux-plugin")),
			))
		})
	})
})
