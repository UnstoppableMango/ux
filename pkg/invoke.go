package ux

import (
	"context"
	"fmt"

	"charm.land/log/v2"
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/nix"
)

type Messages map[string]*InvokeMessage

var ErrNoDestination = fmt.Errorf("link has no destination")

func Invoke(ctx context.Context, config *Config, file []byte) (Messages, error) {
	msgs := Messages{}
	for _, link := range config.GetLinks() {
		switch link.WhichSource() {
		case uxv1alpha1.Link_Derivation_case:
			handle("TODO", msgs, handleDrv(ctx, link))
		}
	}
	log.Debug("Nothing to do")
	return msgs, nil
}

func handleDrv(
	ctx context.Context,
	link *uxv1alpha1.Link,
) error {
	if !link.HasDestination() {
		return ErrNoDestination
	}

	dest := link.GetDestination()
	if !dest.HasRelativePath() {
		return fmt.Errorf("missing relative_path: %w", ErrNoDestination)
	}

	return nix.Realise(ctx,
		[]string{link.GetDerivation().GetPath()},
		[]string{dest.GetRelativePath()},
	)
}

func handle(name string, msgs Messages, err error) {
	if err != nil {
		msgs[name] = handleError(err)
	}
}

func handleError(err error) *InvokeMessage {
	if err == nil {
		return nil
	}
	b := &uxv1alpha1.InvokeMessage_builder{
		Level: new("error"),
		Lines: []string{err.Error()},
	}
	return b.Build()
}
