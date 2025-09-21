package skel

import (
	"io"
	"os"

	"github.com/unmango/go/cli"
)

type CmdArgs struct {
	Args      []string
	StdinData []byte
}

type UxFuncs struct {
	Generate func(*CmdArgs) error
	Execute  func(*CmdArgs) error
}

func PluginMainOs(funcs UxFuncs, stdin io.Reader, args []string) error {
	stdinData, err := io.ReadAll(stdin)
	if err != nil {
		return err
	}

	cmdArgs := &CmdArgs{
		Args:      args,
		StdinData: stdinData,
	}

	if funcs.Execute != nil {
		return funcs.Execute(cmdArgs)
	} else {
		return nil
	}
}

func PluginMain(funcs UxFuncs) {
	if err := PluginMainOs(funcs, os.Stdin, os.Args[1:]); err != nil {
		cli.Fail(err)
	}
}
