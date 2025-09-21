package conformance

import (
	. "github.com/onsi/ginkgo/v2" //nolint:staticcheck
	. "github.com/onsi/gomega"    //nolint:staticcheck

	ux "github.com/unstoppablemango/ux/pkg"
)

type SuiteOptions struct {
	Plugin ux.Plugin
}

func NewSuite(opts SuiteOptions) bool {
	return Describe("Conformance", func() {
		var plugin ux.Plugin

		BeforeEach(func() {
			plugin = opts.Plugin
		})

		It("should create a generator", func() {
			g, err := plugin.Generator(nil, nil)

			Expect(err).NotTo(HaveOccurred())
			Expect(g).NotTo(BeNil())
		})
	})
}
