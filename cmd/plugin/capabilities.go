package plugin

import (
	"fmt"

	"github.com/spf13/cobra"
	"github.com/unmango/go/cli"
	"github.com/unstoppablemango/ux/pkg/plugin/registry"
)

var capabilitiesCmd = NewCapabilities()

func init() {
	PluginCmd.AddCommand(capabilitiesCmd)
}

func NewCapabilities() *cobra.Command {
	return &cobra.Command{
		Use:     "capabilities",
		Short:   "Print plugin capabilities",
		Aliases: []string{"caps"},
		Run: func(cmd *cobra.Command, args []string) {
			capabilities, err := registry.Capabilities(cmd.Context())
			if err != nil {
				cli.Fail(err)
			}

			for name, caps := range capabilities {
				fmt.Println(name)

				var n int
				for c := range caps {
					n, _ = fmt.Printf("\tfrom: %s, to: %s, lossy: %v\n",
						c.From, c.To, c.Lossy,
					)
				}
				if n <= 0 {
					fmt.Println("\tnone")
				}
			}
		},
	}
}
