package cmd

import (
	"github.com/spf13/cobra"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/cli"
	"github.com/unstoppablemango/ux/pkg/plugin/registry"
)

type GenerateOptions struct {
	cli.Options
}

var generateCmd = NewGenerate(GenerateOptions{})

func init() {
	rootCmd.AddCommand(generateCmd)
}

func NewGenerate(options GenerateOptions) *cobra.Command {
	cmd := &cobra.Command{
		Use:     "generate",
		Short:   "Code generation commands",
		Aliases: []string{"gen"},
		Run: func(cmd *cobra.Command, args []string) {
			input, err := cli.Parse(options.Options, args)
			if err != nil {
				cli.Fail(err)
			}

			ctx := cmd.Context()
			plugins, err := registry.Default.List(ctx)
			if err != nil {
				cli.Fail(err)
			}

			caps := map[*uxv1alpha1.Capability]ux.Plugin{}
			for _, plugin := range plugins {
				capabilities, err := plugin.Capabilities(ctx, &uxv1alpha1.CapabilitiesRequest{})
				if err != nil {
					cli.Fail(err)
				}

				for _, c := range capabilities.All {
					caps[c] = plugin
				}
			}
		},
	}

	cli.Flags(cmd, &options.Options)

	return cmd
}
