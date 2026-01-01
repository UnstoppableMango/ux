package cmd

import (
	"context"
	"fmt"
	"os/exec"

	"github.com/charmbracelet/log"
	"github.com/spf13/cobra"
	"github.com/unmango/go/cli"
	"github.com/unmango/go/os"
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

			ctx := cmd.Context()
			if len(args) == 0 {
				err = generateConfig(ctx)
			} else {
				err = generateTarget(ctx, args)
			}

			if err != nil {
				cli.Fail(err)
			}
		},
	}
}

func generateConfig(ctx context.Context) error {
	conf, err := config.Read(config.NewViper())
	if err != nil {
		return fmt.Errorf("reading config: %w", err)
	}

	for name, target := range conf.Targets {
		log := log.With("name", name, "type", target.Type)

		log.Info("Generating target")
		if target.Type != "cli" {
			log.Warn("Unsupported target")
			continue
		}

		command := target.Command
		if len(command) == 0 {
			log.Error("No command specified for target")
			continue
		}

		os := os.FromContext(ctx)
		workspace, err := os.MkdirTemp("", "")
		if err != nil {
			log.Errorf("Creating workspace: %s", err)
		}

		cmd := exec.CommandContext(ctx, command[0])
		cmd.Args = command
		cmd.Dir = workspace
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
