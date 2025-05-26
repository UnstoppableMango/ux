package plugin

import (
	"github.com/unmango/go/iter"
	ux "github.com/unstoppablemango/ux/pkg"
)

type List = iter.Seq2[string, ux.Plugin]

var EmptyList = List(iter.Empty2[string, ux.Plugin]())
