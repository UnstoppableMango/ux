package nix

import (
	"context"
	"fmt"

	"charm.land/log/v2"
	nixv1alpha1 "github.com/unstoppablemango/ux/gen/nix/v1alpha1"
)

func Realise(ctx context.Context, paths []string, roots []string) error {
	realise := &nixv1alpha1.StoreRealise_builder{
		Paths: paths,
	}
	req := &nixv1alpha1.StoreRequest_builder{
		Realise:  realise.Build(),
		AddRoots: roots,
	}
	res, err := Store(ctx, req.Build())
	if err != nil {
		return err
	}
	return handleResult(res.GetResult())
}

func handleResult(result *nixv1alpha1.Result) error {
	log := log.With("code", result.GetExitCode())
	if result.HasStderr() {
		log = log.With("stderr", result.GetStderr())
	}
	if result.HasStdout() {
		log = log.With("stdout", result.GetStdout())
	}
	if code := result.GetExitCode(); code != 0 {
		log.Error("Realise failed")
		return fmt.Errorf("exit code: %d", code)
	}
	log.Debug("Realise success")
	return nil
}
