package cmd

import (
	"encoding/json"
	"os"
	"path/filepath"

	"github.com/charmbracelet/log"
	"github.com/onsi/ginkgo/v2"
	"github.com/onsi/ginkgo/v2/types"
	"github.com/onsi/gomega"
	"github.com/spf13/cobra"
	"github.com/unmango/go/cli"
	"github.com/unstoppablemango/ux/pkg/conformance"
)

var conformanceCmd = NewConformance()

func init() {
	pluginCmd.AddCommand(conformanceCmd)
}

func NewConformance() *cobra.Command {
	return &cobra.Command{
		Use:   "conformance",
		Short: "Perform conformance tests",
		Args:  cobra.ExactArgs(1),
		Run: func(cmd *cobra.Command, args []string) {
			log := log.With("cmd", "conformance")

			log.Debug("Initializing suite")
			t := conformance.T{}
			conformance.NewSuite(conformance.SuiteOptions{
				Plugin: args[0],
			})

			log.Debug("Creating temp dir")
			tmp, err := os.MkdirTemp("", "")
			if err != nil {
				cli.Fail(err)
			}

			log.Debug("Configuring Ginkgo")
			reportPath := filepath.Join(tmp, "report.json")
			_, config := ginkgo.GinkgoConfiguration()
			config.JSONReport = reportPath

			log.Info("Running conformance suite")
			gomega.RegisterFailHandler(ginkgo.Fail)
			ginkgo.RunSpecs(t, "Ux Conformance", config)

			log.Debug("Reading conformance report")
			reportFile, err := os.Open(reportPath)
			if err != nil {
				cli.Fail(err)
			}

			report := []types.Report{}
			decoder := json.NewDecoder(reportFile)
			if err := decoder.Decode(&report); err != nil {
				cli.Fail(err)
			}
		},
	}
}
