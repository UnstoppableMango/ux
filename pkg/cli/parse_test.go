package cli_test

import (
	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"

	"github.com/unstoppablemango/ux/pkg/cli"
)

var _ = Describe("Parse", func() {
	It("should open stdin", func() {
		input, err := cli.Parse([]string{"-"}, cli.Options{})

		Expect(err).NotTo(HaveOccurred())
		Expect(input.Sources()).To(HaveKey("-"))
	})
})
