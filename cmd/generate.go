package cmd

import (
	"context"
	"fmt"
	"os/exec"
	"path/filepath"

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

		log.Info("Creating workspace")
		os := os.FromContext(ctx)
		workspace, err := os.MkdirTemp("", "")
		if err != nil {
			log.Errorf("Creating workspace: %s", err)
			continue
		}

		log = log.With("workspace", workspace)
		defer cleanup(os, workspace)

		cwd, err := os.Getwd()
		if err != nil {
			log.Errorf("Getting current working directory: %s", err)
			continue
		}

		log.Info("Linking inputs")
		if err := linkInputs(os, cwd, workspace, target.Inputs); err != nil {
			log.Errorf("Linking inputs: %s", err)
			continue
		}

		cmd := exec.CommandContext(ctx, command[0])
		cmd.Args = append(command, target.Args...)
		cmd.Dir = workspace

		log.Info("Running CLI", "command", cmd.Args)
		if out, err := cmd.CombinedOutput(); err != nil {
			log.Error("Running command", "err", err, "out", string(out))
		} else {
			log.Info("Command output", "out", string(out))
		}
	}

	return nil
}

func linkInputs(os os.Os, cwd, workspace string, inputs []string) error {
	for _, input := range inputs {
		if !filepath.IsAbs(input) {
			input = filepath.Join(cwd, input)
		}

		link := filepath.Join(workspace, filepath.Base(input))
		if err := os.Symlink(input, link); err != nil {
			return fmt.Errorf("linking input %s: %w", input, err)
		} else {
			log.Infof("Linked input %s to %s", input, link)
		}
	}

	return nil
}

func cleanup(os os.Os, workspace string) {
	log.Info("Cleaning up workspace")
	if err := os.RemoveAll(workspace); err != nil {
		log.Errorf("Cleaning up workspace: %s", err)
	}
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
