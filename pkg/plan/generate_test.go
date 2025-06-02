package plan_test

import (
	"maps"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/plan"
	"github.com/unstoppablemango/ux/pkg/plugin"
)

var _ = Describe("Generate", func() {
	It("should plan an exact match", func() {
		expected := plugin.LocalBinary("dummy")
		cap := &uxv1alpha1.Capability{From: "a", To: "b"}
		inv := map[*uxv1alpha1.Capability]ux.Plugin{
			cap: expected,
		}

		p, err := plan.Generate(maps.All(inv), "a", "b")

		Expect(err).NotTo(HaveOccurred())
		Expect(p).To(ConsistOf(expected))
	})

	It("should plan two plugins", func() {
		a := plugin.LocalBinary("a")
		b := plugin.LocalBinary("b")

		capA := &uxv1alpha1.Capability{From: "a", To: "b"}
		capB := &uxv1alpha1.Capability{From: "b", To: "c"}

		inv := map[*uxv1alpha1.Capability]ux.Plugin{
			capA: a,
			capB: b,
		}

		p, err := plan.Generate(maps.All(inv), "a", "c")

		Expect(err).NotTo(HaveOccurred())
		Expect(p).To(ConsistOf(a, b))
	})
})
