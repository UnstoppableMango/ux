package e2e_test

import (
	"context"
	"os/exec"
	"path/filepath"
	"testing"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	"github.com/onsi/gomega/gexec"

	"github.com/unmango/go/vcs/git"
)

var (
	gitRoot string
	uxPath  string
)

func TestE2e(t *testing.T) {
	RegisterFailHandler(Fail)
	RunSpecs(t, "E2e Suite")
}

var _ = BeforeSuite(func(ctx context.Context) {
	cwd, err := git.Root(ctx)
	Expect(err).NotTo(HaveOccurred())
	gitRoot = cwd

	uxPath, err = gexec.Build(filepath.Join(cwd, "main.go"))
	Expect(err).NotTo(HaveOccurred())
})

var _ = AfterSuite(func() {
	gexec.CleanupBuildArtifacts()
})

func Run(cmd *exec.Cmd) *gexec.Session {
	GinkgoHelper()

	ses, err := gexec.Start(cmd, GinkgoWriter, GinkgoWriter)
	Expect(err).NotTo(HaveOccurred())

	return ses
}
