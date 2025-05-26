package sdk

import "context"

type Plugin interface {
	Invoke(context.Context, Host) error
}
