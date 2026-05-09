package nix

import (
	"context"
	"fmt"

	nixv1alpha1 "github.com/unstoppablemango/ux/gen/nix/v1alpha1"
)

func Realise(ctx context.Context, paths []string, dryRun bool) error {
	realise := &nixv1alpha1.StoreRealise_builder{
		Paths:  paths,
		DryRun: &dryRun,
	}
	req := &nixv1alpha1.StoreRequest_builder{
		Realise: realise.Build(),
	}
	res, err := NewCli().Store(ctx, req.Build())
	if err != nil {
		return err
	}

	return handleResult(res.GetResult())
}

func handleResult(result *nixv1alpha1.Result) error {
	if code := result.GetExitCode(); code != 0 {
		return fmt.Errorf("non-zero exit code: %d", code)
	}
	return nil
}
