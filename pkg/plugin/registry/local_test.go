package registry_test

import (
	"context"
	"os"
	"path/filepath"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"

	"github.com/unstoppablemango/ux/pkg/plugin/registry"
)

var _ = Describe("Local", func() {
	Describe("BinPattern", func() {
		DescribeTable("should match", func(path string) {
			matches := registry.BinPattern.MatchString(path)
			Expect(matches).To(BeTrueBecause("The path matches plugin.BinPattern"))
		},
			Entry(nil, "pcl2openapi"),
			Entry(nil, "ux-plugin"),
			Entry(nil, "ux-plugin-name"),
			Entry(nil, "directory/a2b"),
			Entry(nil, "some/path/a2b"),
			Entry(nil, "/a/rooted/path/a2b"))

		DescribeTable("should NOT match", func(path string) {
			matches := registry.BinPattern.MatchString(path)
			Expect(matches).To(BeFalseBecause("The path does not match plugin.BinPattern"))
		},
			Entry(nil, "kubectl-plugin"),
			Entry(nil, "a3b"))
	})

	Describe("Directory", func() {
		var path string

		BeforeEach(func() {
			cwd, err := os.Getwd()
			Expect(err).NotTo(HaveOccurred())
			path = filepath.Join(cwd, "testdata")
		})

		It("should list plugins", func(ctx context.Context) {
			dir := registry.LocalDirectory{Path: path}

			plugins, err := dir.List(ctx)

			Expect(err).NotTo(HaveOccurred())
			Expect(plugins).NotTo(BeEmpty())
			Expect(plugins).To(HaveKeyWithValue("a2b",
				HaveField("Path", filepath.Join(path, "a2b")),
			))
			Expect(plugins).To(HaveKeyWithValue("ux-plugin",
				HaveField("Path", filepath.Join(path, "ux-plugin")),
			))
		})
	})
})
