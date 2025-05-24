package ux

import "context"

type Plugin interface {
	Acknowledge(context.Context, Host) error
}
