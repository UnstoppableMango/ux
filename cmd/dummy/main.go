package main

import (
	"fmt"

	"github.com/unstoppablemango/ux/pkg/plugin/skel"
)

func execute(args *skel.CmdArgs) error {
	fmt.Println("executed with:", args.Args)
	return nil
}

func main() {
	skel.PluginMain(skel.UxFuncs{
		Execute: execute,
	})
}
