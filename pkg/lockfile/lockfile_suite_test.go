package lockfile_test

import (
	"testing"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
)

func TestLockfile(t *testing.T) {
	RegisterFailHandler(Fail)
	RunSpecs(t, "Lockfile Suite")
}
