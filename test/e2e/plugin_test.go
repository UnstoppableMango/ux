package e2e_test

import (
	"fmt"
	"os/exec"

	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	"github.com/onsi/gomega/gbytes"
	"github.com/onsi/gomega/gexec"
)

var _ = Describe("Plugin", func() {
	It("should execute", func() {
		cmd := exec.Command(uxPath)

		ses := Run(cmd)

		Eventually(ses).Should(gexec.Exit(0))
	})

	It("should execute the Go dummy plugin", func() {
		cmd := exec.Command(uxPath, "plugin", "run", goDummyPath, "test")
		cmd.Env = append(cmd.Env, fmt.Sprintf("ALLOW_PLUGIN=%s", goDummyPath))

		ses := Run(cmd)

		Eventually(ses).Should(gexec.Exit(0))
		Expect(ses.Err).To(gbytes.Say(`executed with: \[test\]`))
	})

	It("should execute the C# dummy plugin", func() {
		cmd := exec.Command(uxPath, "plugin", "run", csDummyPath, "test")
		cmd.Env = append(cmd.Env, fmt.Sprintf("ALLOW_PLUGIN=%s", csDummyPath))

		ses := Run(cmd)

		Eventually(ses).Should(gexec.Exit(0))
		Expect(ses.Err).To(gbytes.Say(`Executed with: \["test"\]`))
	})

	It("should search for the dummy plugin", func() {
		cmd := exec.Command(uxPath, "plugin", "search", "dummy")

		ses := Run(cmd)

		Eventually(ses).Should(gexec.Exit(0))
		Expect(ses.Out).To(gbytes.Say("dummy"))
	})
})
