package planner

import (
	"fmt"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
	"github.com/unstoppablemango/ux/pkg/plan"
	"github.com/unstoppablemango/ux/pkg/ux"
)

type Planner struct {
	inventory map[*uxv1alpha1.Capability]ux.Plugin
}

func (p Planner) Plan(from, to string) (ux.Plan, error) {
	for cap, p := range p.inventory {
		if cap.From == from && cap.To == to {
			return plan.Singleton(p), nil
		}
	}

	return nil, fmt.Errorf("no plan for target")
}
