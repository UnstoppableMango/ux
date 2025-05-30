package cmd

import (
	"context"

	"github.com/spf13/cobra"
	"github.com/unstoppablemango/ux/sdk/plugin"
)

func New(name string, cli plugin.Cli) *cobra.Command {
	cmd := &cobra.Command{
		Use:    name,
		Hidden: true,
	}
	cmd.AddCommand(
		NewCapabilities(cli),
		NewGenerate(cli),
	)

	return cmd
}

func Execute(name string, cli plugin.Cli) error {
	return New(name, cli).Execute()
}

func ExecuteContext(ctx context.Context, name string, cli plugin.Cli) error {
	return New(name, cli).ExecuteContext(ctx)
}
