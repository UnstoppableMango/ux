package main

import (
	"github.com/unmango/go/cli"
	"github.com/unstoppablemango/ux/cmd"
	"go.podman.io/storage/pkg/reexec"
)

func main() {
	// For go.podman.io/storage
	if reexec.Init() {
		return
	}

	if err := cmd.Execute(); err != nil {
		cli.Fail(err)
	}
}
