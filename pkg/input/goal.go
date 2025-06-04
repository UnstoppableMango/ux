package input

import (
	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	ux "github.com/unstoppablemango/ux/pkg"
)

func Goal(input ux.Input) (*uxv1alpha1.Capability, error) {
	head, err := Head(input)
	if err != nil {
		return nil, err
	}

	target, err := Target(input)
	if err != nil {
		return nil, err
	}

	return &uxv1alpha1.Capability{
		From:  head,
		To:    target,
		Lossy: true,
	}, nil
}
