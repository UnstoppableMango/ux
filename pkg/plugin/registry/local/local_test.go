package local_test

import (
	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	"github.com/unstoppablemango/ux/pkg/plugin/registry/local"
)

var _ = Describe("Local", func() {
	Describe("BinPattern", func() {
		DescribeTable("should match", func(path string) {
			matches := local.BinPattern.MatchString(path)
			Expect(matches).To(BeTrueBecause("The path matches plugin.BinPattern"))
		},
			Entry(nil, "pcl2openapi"),
			Entry(nil, "ux-plugin"),
			Entry(nil, "ux-plugin-name"),
			Entry(nil, "directory/a2b"),
			Entry(nil, "some/path/a2b"),
			Entry(nil, "/a/rooted/path/a2b"))

		DescribeTable("should NOT match", func(path string) {
			matches := local.BinPattern.MatchString(path)
			Expect(matches).To(BeFalseBecause("The path matched plugin.BinPattern"))
		},
			Entry(nil, "kubectl-plugin"),
			Entry(nil, "a3b"),
			Entry(nil, "tdl-linux-amd64.tar.gz"))
	})
})
