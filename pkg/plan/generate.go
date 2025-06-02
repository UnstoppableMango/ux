package plan

import (
	"fmt"
	"slices"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/plugin"
)

// Lots of potential for refactoring in here

const (
	MaxIterations = 10
	MaxLength     = 10
)

func Generate(inv plugin.Inventory, from, to string) (ux.Plan, error) {
	plan := []ux.Plugin{}

	for i := 0; true; i++ {
		if i >= MaxIterations {
			return nil, fmt.Errorf("max iterations reached")
		}
		if len(plan) > MaxLength {
			return nil, fmt.Errorf("plan length reached")
		}

		plugin, done := next(inv, from, to)
		if plugin == nil {
			return nil, fmt.Errorf("no viable plugins")
		}
		if slices.Contains(plan, plugin) {
			return nil, fmt.Errorf("cycle detected")
		} else {
			plan = append(plan, plugin)
		}
		if done {
			return slices.Values(plan), nil
		}

		// TODO: Need the selected capability to update from and to
	}

	return slices.Values(plan), nil
}

func next(inv plugin.Inventory, from, to string) (ux.Plugin, bool) {
	candidates := map[*uxv1alpha1.Capability]ux.Plugin{}
	for cap, p := range inv {
		if cap.From == from {
			if cap.To == to {
				return p, true
			} else {
				candidates[cap] = p
			}
		}
	}

	other := map[*uxv1alpha1.Capability]ux.Plugin{}
	for cap, p := range candidates {
		if !cap.Lossy {
			return p, false
		} else {
			other[cap] = p
		}
	}

	if len(other) > 0 {
		return first(other), false
	} else {
		return nil, false
	}
}

func first(inv map[*uxv1alpha1.Capability]ux.Plugin) ux.Plugin {
	for _, p := range inv {
		return p
	}

	panic("first called with empty map")
}
