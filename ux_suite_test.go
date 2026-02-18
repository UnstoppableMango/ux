package main_test

import (
	"embed"
	"os"
	"testing"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	"github.com/onsi/gomega/gexec"
)

var (
	//go:embed testdata
	testdata embed.FS
	root     string
	uxBin    string
)

func TestUx(t *testing.T) {
	RegisterFailHandler(Fail)
	RunSpecs(t, "Ux Suite")
}

var _ = BeforeSuite(func() {
	var err error
	root, err = os.Getwd()
	Expect(err).NotTo(HaveOccurred())
	uxBin, err = gexec.Build("main.go")
	Expect(err).NotTo(HaveOccurred())
})

var _ = AfterSuite(func() {
	gexec.CleanupBuildArtifacts()
})
