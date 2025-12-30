package cmd

import (
	"context"
	"fmt"

	"github.com/spf13/cobra"
	"github.com/unmango/go/cli"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/config"
	"github.com/unstoppablemango/ux/pkg/input"
	"github.com/unstoppablemango/ux/pkg/spec"
	"github.com/unstoppablemango/ux/pkg/work"
)

func NewGenerate() *cobra.Command {
	return &cobra.Command{
		Use:     "generate [TARGET] [INPUT] [ARGS...]",
		Short:   "Generate code",
		Aliases: []string{"gen"},
		Args: func(cmd *cobra.Command, args []string) error {
			if len(args) != 0 && len(args) < 2 {
				return fmt.Errorf("either provide no arguments to generate all targets or provide TARGET and INPUT to generate a specific target")
			}

			return nil
		},
		Run: func(cmd *cobra.Command, args []string) {
			var err error
			if len(args) == 0 {
				err = generateConfig()
			} else {
				err = generateTarget(cmd.Context(), args)
			}

			if err != nil {
				cli.Fail(err)
			}
		},
	}
}

func generateConfig() error {
	conf, err := config.Read(config.NewViper())
	if err != nil {
		return fmt.Errorf("reading config: %w", err)
	}

	for name := range conf.Targets {
		fmt.Printf("Generating target: %s\n", name)
	}

	return nil
}

func generateTarget(ctx context.Context, args []string) error {
	target := spec.Token(args[0])
	input, err := input.Parse(args[1])
	if err != nil {
		return fmt.Errorf("parsing input: %w", err)
	}

	ws, err := work.Cwd()
	if err != nil {
		return fmt.Errorf("getting current workspace: %w", err)
	}

	if err := ux.Generate(ctx, ws, target, input); err != nil {
		return fmt.Errorf("generating code: %w", err)
	}

	return nil
}
