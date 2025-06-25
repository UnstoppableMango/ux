package plugin_test

import (
	"os"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	"github.com/spf13/afero"

	"github.com/unstoppablemango/ux/pkg/plugin"
)

var _ = Describe("Fs", func() {
	Describe("Sanity", func() {
		It("should have an input", func() {
			input := afero.NewMemMapFs()
			err := afero.WriteFile(input, "/test.txt", []byte("testing"), os.ModePerm)
			Expect(err).NotTo(HaveOccurred())

			_, pluginfs := plugin.NewFs(input)

			_, err = pluginfs.Open("/input/test.txt")
			Expect(err).NotTo(HaveOccurred())
		})

		It("should have an output", func() {
			input := afero.NewMemMapFs()

			output, pluginfs := plugin.NewFs(input)

			err := afero.WriteFile(output, "/test.txt", []byte("testing"), os.ModePerm)
			Expect(err).NotTo(HaveOccurred())

			_, err = pluginfs.Open("/output/test.txt")
			Expect(err).NotTo(HaveOccurred())
		})
	})
})
