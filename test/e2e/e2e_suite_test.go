package e2e_test

import (
	"context"
	"embed"
	"io/fs"
	"os"
	"os/exec"
	"path/filepath"
	"testing"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	"github.com/onsi/gomega/gexec"
	"github.com/unstoppablemango/ux/test/util"

	"github.com/unmango/go/vcs/git"
)

var (
	gitRoot     string
	uxPath      string
	goDummyPath string
	csDummyPath string

	//go:embed testdata
	testdata embed.FS
)

func TestE2e(t *testing.T) {
	RegisterFailHandler(Fail)
	RunSpecs(t, "E2e Suite", Label("E2E"))
}

var _ = BeforeSuite(func(ctx context.Context) {
	cwd, err := git.RootContext(ctx)
	Expect(err).NotTo(HaveOccurred())
	gitRoot = cwd

	uxPath, err = gexec.Build(filepath.Join(cwd, "main.go"))
	Expect(err).NotTo(HaveOccurred())

	goDummyPath, err = gexec.Build(filepath.Join(cwd, "cmd", "dummy", "main.go"))
	Expect(err).NotTo(HaveOccurred())

	csDummyPath, err = util.BuildCsharpDummy(filepath.Join(cwd, "examples", "csharp", "Dummy"))
	Expect(err).NotTo(HaveOccurred())
})

var _ = AfterSuite(func() {
	gexec.CleanupBuildArtifacts()
	util.CleanupCsharpDummy()
})

func Run(cmd *exec.Cmd) *gexec.Session {
	GinkgoHelper()

	ses, err := gexec.Start(cmd, GinkgoWriter, GinkgoWriter)
	Expect(err).NotTo(HaveOccurred())

	return ses
}

func CopyTestdata(dest string) {
	sub, err := fs.Sub(testdata, "testdata")
	Expect(err).NotTo(HaveOccurred())
	Expect(os.CopyFS(dest, sub)).To(Succeed())
}
