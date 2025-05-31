package local_test

import (
	"os"
	"path/filepath"
	"testing"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
)

var (
	cwd      string
	testdata string
)

func TestLocal(t *testing.T) {
	RegisterFailHandler(Fail)
	RunSpecs(t, "Local Suite")
}

var _ = BeforeSuite(func() {
	var err error
	cwd, err = os.Getwd()
	Expect(err).NotTo(HaveOccurred())
	testdata = filepath.Join(cwd, "testdata")
})
