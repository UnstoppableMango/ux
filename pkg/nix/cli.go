package nix

import (
	"bytes"
	"context"
	"errors"
	"os/exec"

	"charm.land/log/v2"
	nixv1alpha1 "github.com/unstoppablemango/ux/gen/nix/v1alpha1"
	"github.com/unstoppablemango/ux/internal"
)

var Cli nixv1alpha1.NixServiceServer = &cli{}

type Response interface {
	SetResult(*Result)
}

type cli struct {
	nixv1alpha1.UnimplementedNixServiceServer
}

func (*cli) Build(ctx context.Context, req *BuildRequest) (*BuildResponse, error) {
	return Build(ctx, req)
}

// Build implements https://nix.dev/manual/nix/2.25/command-ref/nix-build
func Build(ctx context.Context, req *BuildRequest) (*BuildResponse, error) {
	res := &BuildResponse{}
	args := BuildArgs(req)
	if err := execute(ctx, "nix-build", args, res); err != nil {
		return nil, err
	}
	return res, nil
}

func (*cli) Instantiate(ctx context.Context, req *InstantiateRequest) (*InstantiateResponse, error) {
	return Instantiate(ctx, req)
}

// Instantiate implements https://nix.dev/manual/nix/2.25/command-ref/nix-instantiate
func Instantiate(ctx context.Context, req *InstantiateRequest) (*InstantiateResponse, error) {
	res := &InstantiateResponse{}
	args := InstantiateArgs(req)
	if err := execute(ctx, "nix-instantiate", args, res); err != nil {
		return nil, err
	}
	return res, nil
}

func (*cli) Store(ctx context.Context, req *StoreRequest) (*StoreResponse, error) {
	return Store(ctx, req)
}

// Store implements https://nix.dev/manual/nix/2.25/command-ref/nix-store
func Store(ctx context.Context, req *StoreRequest) (*StoreResponse, error) {
	res := &StoreResponse{}
	args := StoreArgs(req)
	if err := execute(ctx, "nix-store", args, res); err != nil {
		return nil, err
	}
	return res, nil
}

func execute(
	ctx context.Context,
	name string,
	args []string,
	res Response,
) error {
	log.Info("Executing command", "name", name, "args", args)
	cmd := exec.CommandContext(ctx, name, args...)
	var stdout, stderr bytes.Buffer
	cmd.Stdout = &stdout
	cmd.Stderr = &stderr

	err := cmd.Run()
	b := nixv1alpha1.Result_builder{
		Stdout: new(stdout.String()),
		Stderr: new(stderr.String()),
	}

	exitErr, ok := errors.AsType[*exec.ExitError](err)
	if err != nil && !ok {
		return err
	} else if ok {
		b.ExitCode = new(int32(exitErr.ExitCode()))
	} else {
		b.ExitCode = new(int32(cmd.ProcessState.ExitCode()))
	}

	res.SetResult(b.Build())
	return nil
}

var logFormats = map[nixv1alpha1.LogFormat]string{
	nixv1alpha1.LogFormat_LOG_FORMAT_BAR:           "bar",
	nixv1alpha1.LogFormat_LOG_FORMAT_RAW:           "raw",
	nixv1alpha1.LogFormat_LOG_FORMAT_INTERNAL_JSON: "internal-json",
	nixv1alpha1.LogFormat_LOG_FORMAT_BAR_WITH_LOGS: "bar-with-logs",
}

func applyCommon(b *internal.CommandBuilder, opts *CommonOptions) {
	b.AppendIf(opts.HasCores(), "--cores", opts.GetCores())
	b.Option(opts.HasVersion(), "--version", opts.GetVersion)
	b.Option(opts.HasQuiet(), "--quiet", opts.GetQuiet)
	b.AppendIf(opts.HasMaxJobs(), "--max-jobs", opts.GetMaxJobs())
	b.Option(opts.HasNoBuildOutput(), "--no-build-output", opts.GetNoBuildOutput)
	b.AppendIf(opts.HasMaxSlientTime(), "--max-silent-time", opts.GetMaxSlientTime())
	b.AppendIf(opts.HasTimeout(), "--timeout", opts.GetTimeout())
	b.AppendIf(opts.HasKeepGoing(), "--keep-going")
	b.Option(opts.HasKeepFailed(), "--keep-failed", opts.GetKeepFailed)
	b.Option(opts.HasFallback(), "--fallback", opts.GetFallback)
	b.Option(opts.HasReadonlyMode(), "--readonly-mode", opts.GetReadonlyMode)

	for name, value := range opts.GetArgs() {
		b.Append("--arg", name, value)
	}
	for name, path := range opts.GetArgsFromFiles() {
		b.Append("--arg-from-file", name, path)
	}
	for _, name := range opts.GetArgsFromStdin() {
		b.Append("--arg-from-stdin", name)
	}
	for name, value := range opts.GetArgstrs() {
		b.Append("--argstr", name, value)
	}
	for _, path := range opts.GetAttrs() {
		b.Append("--attr", path)
	}

	if opts.HasVerbose() {
		for range opts.GetVerbose() {
			b.Append("--verbose")
		}
	}

	if opts.HasLogFormat() {
		if format, ok := logFormats[opts.GetLogFormat()]; ok {
			b.Append("--log-format", format)
		}
	}
}

func BuildArgs(req *BuildRequest) []string {
	b := &internal.CommandBuilder{}
	b.AppendIf(req.HasDryRun(), "--dry-run")
	b.AppendIf(req.HasNoOutLink(), "--no-out-link")
	b.AppendIf(req.HasOutLink(), "--out-link")

	if req.HasCommon() {
		applyCommon(b, req.GetCommon())
	}

	return b.Build()
}

func InstantiateArgs(req *InstantiateRequest) []string {
	b := &internal.CommandBuilder{}
	b.AppendIf(req.HasAddRoot(), "--add-root", req.GetAddRoot())
	b.Option(req.HasParse(), "--parse", req.GetParse)
	b.Option(req.HasEval(), "--eval", req.GetEval)
	b.Option(req.HasFindFile(), "--find-file", req.GetFindFile)
	b.Option(req.HasStrict(), "--strict", req.GetStrict)
	b.Option(req.HasRaw(), "--raw", req.GetRaw)
	b.Option(req.HasJson(), "--json", req.GetJson)
	b.Option(req.HasXml(), "--xml", req.HasXml)
	b.Option(req.HasReadWriteMode(), "--read-write-mode", req.GetReadWriteMode)

	if req.HasCommon() {
		applyCommon(b, req.GetCommon())
	}

	return b.Build()
}

func StoreArgs(req *StoreRequest) []string {
	b := &internal.CommandBuilder{}
	for name, value := range req.GetOptions() {
		b.Append("--option", name, value)
	}
	for _, path := range req.GetAddRoots() {
		b.Append("--add-root", path)
	}

	switch req.WhichOperation() {
	case nixv1alpha1.StoreRequest_Realise_case:
		if req.HasRealise() {
			r := req.GetRealise()
			b.Append("--realise")
			internal.AppendAll(b, r.GetPaths())
			b.Opt("--dry-run", r.HasDryRun, r.GetDryRun)
		}
	default:
		// TODO
	}

	if req.HasCommon() {
		applyCommon(b, req.GetCommon())
	}

	return b.Build()
}
