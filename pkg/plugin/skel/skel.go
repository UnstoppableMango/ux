package skel

import (
	"bytes"
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
	stat, err := os.Stdin.Stat()
	if err != nil {
		cli.Fail(err)
	}

	var stdin io.Reader
	if (stat.Mode() & os.ModeCharDevice) == 0 {
		stdin = os.Stdin
	} else {
		stdin = &bytes.Buffer{}
	}

	if err := PluginMainOs(funcs, stdin, os.Args[1:]); err != nil {
		cli.Fail(err)
	}
}
