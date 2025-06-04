package payload_test

import (
	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	"github.com/unmango/go/codec"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/payload"
)

var _ = Describe("Codec", func() {
	DescribeTable("Json",
		func(typ string) {
			c, err := payload.Codec(&uxv1alpha1.Payload{
				ContentType: typ,
			})

			Expect(err).NotTo(HaveOccurred())
			Expect(c).To(Equal(codec.Json))
		},
		Entry(nil, "application/json"),
	)

	DescribeTable("Protobuf",
		func(typ string) {
			c, err := payload.Codec(&uxv1alpha1.Payload{
				ContentType: typ,
			})

			Expect(err).NotTo(HaveOccurred())
			Expect(c).To(BeAssignableToTypeOf(codec.GoogleProto))
		},
		Entry(nil, "application/protobuf"),
		Entry(nil, "application/x-protobuf"),
		Entry(nil, "application/vnd.google.protobuf"),
		Entry(nil, "application/x-google-protobuf"),
	)

	DescribeTable("Yaml",
		func(typ string) {
			c, err := payload.Codec(&uxv1alpha1.Payload{
				ContentType: typ,
			})

			Expect(err).NotTo(HaveOccurred())
			Expect(c).To(BeIdenticalTo(codec.GoYaml))
		},
		Entry(nil, "application/yaml"),
		Entry(nil, "application/x-yaml"),
		Entry(nil, "text/yaml"),
		Entry(nil, "text/x-yaml"),
	)
})
