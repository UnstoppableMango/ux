package cmd

import (
	"github.com/spf13/cobra"
	"github.com/unstoppablemango/ux/pkg/config"
)

var (
	root = NewUx()
)

func Execute() error {
	return root.Execute()
}

func init() {
	cfg := config.NewBuilder()
	cobra.OnInitialize(cfg.Initialize)
	cfg.BindPersistentFlags(root)

	plugin := NewPlugin()
	plugin.AddCommand(NewConformance())

	root.AddCommand(
		NewCli(),
		NewGenerate(),
		plugin,
	)
}
