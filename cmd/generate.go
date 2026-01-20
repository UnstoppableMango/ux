package cmd

import (
	"fmt"
	"os"

	"github.com/charmbracelet/log"
	"github.com/spf13/afero"
	"github.com/spf13/cobra"
	"github.com/unmango/aferox"
	"github.com/unmango/aferox/filter"
	"github.com/unmango/aferox/gitignore"
	"github.com/unstoppablemango/ux/pkg/cli"
)

func NewGenerate() *cobra.Command {
	return &cobra.Command{
		Use:     "generate [TARGET] [INPUT] [ARGS...]",
		Short:   "Generate code",
		Aliases: []string{"gen"},
		Args:    cobra.MinimumNArgs(2),
		Run: func(cmd *cobra.Command, args []string) {
			if err := generate(); err != nil {
				cli.Fail(err)
			}
		},
	}
}

func generate() error {
	cwd, err := os.Getwd()
	if err != nil {
		return fmt.Errorf("getwd: %w", err)
	}

	osfs := afero.NewOsFs()
	tmp, err := afero.TempDir(osfs, "", "")
	if err != nil {
		return fmt.Errorf("tempdir: %w", err)
	}

	tmpfs := afero.NewBasePathFs(osfs, tmp)

	workfs := afero.NewBasePathFs(osfs, cwd)
	workfs, err = gitignore.OpenDefault(workfs)
	if err != nil {
		return fmt.Errorf("opening default gitignore: %w", err)
	}

	workfs = filter.NewFs(workfs, func(s string) bool {
		log.Infof("Filtering %s", s)
		return false
	})

	if err := aferox.Copy(workfs, tmpfs); err != nil {
		return fmt.Errorf("copy: %w", err)
	}

	return nil
}
