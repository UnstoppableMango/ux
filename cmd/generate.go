package cmd

import (
	"io"

	"github.com/charmbracelet/log"
	"github.com/spf13/cobra"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/cli"
	"github.com/unstoppablemango/ux/pkg/plugin"
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
		Args:    cobra.MinimumNArgs(1),
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

			plugin, found := find(plugins, args[0])
			if !found {
				cli.Fail("Unable to find plugin for target", args[0])
			}

			var source ux.Source
			for _, s := range input.Sources() {
				source = s
				break
			}
			if source == nil {
				cli.Fail("No input sources")
			}

			r, err := source.Open(ctx)
			if err != nil {
				cli.Fail(err)
			}

			data, err := io.ReadAll(r)
			if err != nil {
				cli.Fail(err)
			}

			res, err := plugin.Generate(ctx, &uxv1alpha1.GenerateRequest{
				Target: args[0],
				Payload: &uxv1alpha1.Payload{
					ContentType: "TODO",
					Data:        data,
				},
			})
			if err != nil {
				cli.Fail(err)
			}

			for _, sink := range input.Sinks() {
				w, err := sink.Open(ctx)
				if err != nil {
					cli.Fail(err)
				}

				if _, err = w.Write(res.Payload.Data); err != nil {
					cli.Fail(err)
				}
			}
		},
	}

	cli.Flags(cmd, &options.Options)

	return cmd
}

func find(plugins plugin.List, target string) (ux.Plugin, bool) {
	for name, plugin := range plugins {
		log.Infof("Considering plugin %s", name)
		if name == target {
			return plugin, true
		}
	}

	return nil, false
}
