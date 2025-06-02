package cap

import (
	ux "github.com/unstoppablemango/ux/pkg"
	"github.com/unstoppablemango/ux/pkg/criteria"
)

type Ranking string

const (
	Exact Ranking = "Exact"
	Partial Ranking = "Partial"
	Lossy Ranking = "Lossy"
	Reject Ranking = "Reject"
)

func Rank(c ux.Criteria) Ranking {
	switch {
	case c[criteria.Exact]:
		return Exact
	case c[criteria.From]:
		return Partial
	case c[criteria.Lossy]:
		return Lossy
	default:
		return Reject
	}
}
