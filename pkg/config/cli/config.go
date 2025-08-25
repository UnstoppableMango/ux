package cli

import (
	"github.com/spf13/cobra"
	ux "github.com/unstoppablemango/ux/pkg"
)

type Builder cobra.Command

func (b *Builder) Configure(c ux.Configure) {
}
