package cmd

import (
	"github.com/spf13/pflag"
	"github.com/unstoppablemango/ux/pkg/config"
)

// ConfigVar defines a string flag named config accepting a configuration file path.
// The argument p points to a string variable in which to store the value of the flag.
func ConfigVar(flags *pflag.FlagSet, p *string) {
	flags.StringVar(p, "config", config.DefaultPath, "config file")
	_ = flags.MarkHidden("config") // TODO: Doesn't do anything yet
}

func VerboseVar(flags *pflag.FlagSet, p *bool) {
	flags.BoolVarP(p, "verbose", "v", false, "Enable verbose output")
}
