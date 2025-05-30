package plugin

import "context"

type Cli interface {
	Capabilities(context.Context) error
	Generate(context.Context) error
}
