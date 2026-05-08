package internal_test

import (
	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"

	"github.com/unstoppablemango/ux/internal"
)

var _ = Describe("Cli", func() {
	It("should append strings", func() {
		b := internal.CommandBuilder{}

		b.Append("test")

		Expect(b.Build()).To(HaveExactElements("test"))
	})

	It("should append integers", func() {
		b := internal.CommandBuilder{}

		b.Append(69)

		Expect(b.Build()).To(HaveExactElements("69"))
	})

	It("should append values", func() {
		b := internal.CommandBuilder{}

		b.Append(420, 69)

		Expect(b.Build()).To(HaveExactElements("420", "69"))
	})

	It("should append values in subsequent calls", func() {
		b := internal.CommandBuilder{}

		b.Append(420)
		b.Append(69)

		Expect(b.Build()).To(HaveExactElements("420", "69"))
	})

	It("should conditionally append", func() {
		b := internal.CommandBuilder{}

		b.AppendIf(true, "69")

		Expect(b.Build()).To(HaveExactElements("69"))
	})

	It("should conditionally skip", func() {
		b := internal.CommandBuilder{}

		b.AppendIf(false, "69")

		Expect(b.Build()).To(BeEmpty())
	})
})
