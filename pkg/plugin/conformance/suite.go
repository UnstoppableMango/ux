package conformance

import (
	"context"

	. "github.com/onsi/ginkgo/v2" //nolint:staticcheck
	. "github.com/onsi/gomega"    //nolint:staticcheck
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/plugin"
)

type SuiteOptions struct {
	Plugin string
}

func NewSuite(opts SuiteOptions) bool {
	return Describe("Conformance", func() {
		It("should list capabilities", func(ctx context.Context) {
			p := plugin.LocalBinary(opts.Plugin)

			res, err := p.Capabilities(ctx, &uxv1alpha1.CapabilitiesRequest{})

			Expect(err).NotTo(HaveOccurred())
			Expect(res).NotTo(BeNil())
			Expect(res.All).NotTo(BeEmpty())
		})
	})
}
