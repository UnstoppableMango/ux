package plugin

import (
	"bytes"
	"context"
	"os/exec"

	"github.com/charmbracelet/log"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"google.golang.org/protobuf/proto"
)

type LocalBinary string

func (l LocalBinary) Path() string {
	return string(l)
}

// Capabilities implements ux.Plugin.
func (l LocalBinary) Capabilities(ctx context.Context, req *uxv1alpha1.CapabilitiesRequest) (*uxv1alpha1.CapabilitiesResponse, error) {
	data, err := proto.Marshal(req)
	if err != nil {
		return nil, err
	}

	stdout, stderr := &bytes.Buffer{}, &bytes.Buffer{}
	cmd := exec.CommandContext(ctx, l.Path(), "capabilities")
	cmd.Stdin = bytes.NewBuffer(data)
	cmd.Stdout = stdout
	cmd.Stderr = stderr

	if err = cmd.Run(); err != nil {
		return nil, err
	}

	res := &uxv1alpha1.CapabilitiesResponse{}
	if err = proto.Unmarshal(stdout.Bytes(), res); err != nil {
		return nil, err
	}

	return res, nil
}

// Generate implements ux.Plugin.
func (l LocalBinary) Generate(ctx context.Context, req *uxv1alpha1.GenerateRequest) (*uxv1alpha1.GenerateResponse, error) {
	log.Debug("Marshaling generate request")
	data, err := proto.Marshal(req)
	if err != nil {
		return nil, err
	}

	stdout, stderr := &bytes.Buffer{}, &bytes.Buffer{}
	cmd := exec.CommandContext(ctx, l.Path(), "generate")
	cmd.Stdin = bytes.NewBuffer(data)
	cmd.Stdout = stdout
	cmd.Stderr = stderr

	log.Debug("Executing plugin binary")
	if err = cmd.Run(); err != nil {
		log.Error("Plugin execution failed",
			"stderr", stderr.String(),
			"stdout", stdout.String(),
		)
		return nil, err
	}

	log.Debug("Unmarshaling response")
	res := &uxv1alpha1.GenerateResponse{}
	if err = proto.Unmarshal(stdout.Bytes(), res); err != nil {
		return nil, err
	}

	return res, nil
}
