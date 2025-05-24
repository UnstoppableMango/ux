package cli

import "github.com/unstoppablemango/ux/pkg/plugin"

func PluginOption(input Input) (plugin.Option, error) {
	if client, err := input.Host.NewClient(); err != nil {
		return nil, err
	} else {
		return plugin.WithClient(client), nil
	}
}

type Plugin struct {
	host Host
}
