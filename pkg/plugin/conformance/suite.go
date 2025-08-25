package conformance

import (
	"context"

	. "github.com/onsi/ginkgo/v2" //nolint:staticcheck
	. "github.com/onsi/gomega"    //nolint:staticcheck

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	ux "github.com/unstoppablemango/ux/pkg"
)

type SuiteOptions struct {
	Plugin ux.LegacyPlugin
}

func NewSuite(opts SuiteOptions) bool {
	return Describe("Conformance", func() {
		var plugin ux.LegacyPlugin

		BeforeEach(func() {
			plugin = opts.Plugin
		})

		It("should list capabilities", func(ctx context.Context) {
			res, err := plugin.Capabilities(ctx, &uxv1alpha1.CapabilitiesRequest{})

			Expect(err).NotTo(HaveOccurred())
			Expect(res).NotTo(BeNil())
			Expect(res.All).NotTo(BeEmpty())
		})
	})
}
