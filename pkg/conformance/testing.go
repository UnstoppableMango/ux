package conformance

import "os"

type T struct{}

func (T) Fail() {
	os.Exit(1)
}
