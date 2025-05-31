package ux

type Marshaler interface {
	Marshal(any) ([]byte, error)
}

type Unmarshaler interface {
	Unmarshal([]byte, any) error
}
