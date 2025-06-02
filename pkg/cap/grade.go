package cap

import (
	"iter"
	"maps"

	uxv1alpha1 "github.com/unstoppablemango/ux/gen/dev/unmango/ux/v1alpha1"
)

type Condition int

const (
	ConditionFalse Condition = iota
	ConditionTrue
	ConditionUnkonwn
)

func Compare(cap *uxv1alpha1.Capability, goal *uxv1alpha1.Capability) iter.Seq2[string, Condition] {
	conditions := map[string]Condition{}
	if cap.From == goal.From {
		conditions["match"] = ConditionTrue
		if cap.To == goal.To {
			conditions["exact"] = ConditionTrue
		}
	}

	return maps.All(conditions)
}
