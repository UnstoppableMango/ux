package local_test

import (
	"context"
	"maps"
	"path/filepath"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	"github.com/unstoppablemango/ux/pkg/plugin"
	"github.com/unstoppablemango/ux/pkg/plugin/registry/local"
)

var _ = Describe("Directory", func() {
	Describe("Cwd", func() {
		It("should list", func(ctx context.Context) {
			dir := local.Cwd.Join("testdata")

			plugins, err := dir.List(ctx)

			Expect(err).NotTo(HaveOccurred())
			Expect(plugins).NotTo(BeEmpty())
			Expect(maps.Collect(plugins)).To(HaveKeyWithValue("a2b",
				plugin.LocalBinary(filepath.Join(testdata, "a2b")),
			))
			Expect(maps.Collect(plugins)).To(HaveKeyWithValue("ux-plugin",
				plugin.LocalBinary(filepath.Join(testdata, "ux-plugin")),
			))
			Expect(maps.Collect(plugins)).NotTo(HaveKey("testdata"))
			Expect(maps.Collect(plugins)).NotTo(HaveKey("ux-thing.bin"))
		})
	})

	Describe("Directory", func() {
		It("should list plugins", func(ctx context.Context) {
			dir := local.Directory(testdata)

			plugins, err := dir.List(ctx)

			Expect(err).NotTo(HaveOccurred())
			Expect(plugins).NotTo(BeEmpty())
			Expect(maps.Collect(plugins)).To(HaveKeyWithValue("a2b",
				plugin.LocalBinary(filepath.Join(testdata, "a2b")),
			))
			Expect(maps.Collect(plugins)).To(HaveKeyWithValue("ux-plugin",
				plugin.LocalBinary(filepath.Join(testdata, "ux-plugin")),
			))
			Expect(maps.Collect(plugins)).NotTo(HaveKey("testdata"))
			Expect(maps.Collect(plugins)).NotTo(HaveKey("ux-thing.bin"))
		})
	})
})
