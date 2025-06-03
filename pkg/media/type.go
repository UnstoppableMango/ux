package media

type Type string

func (t Type) Marshal(v any) ([]byte, error) {
	return nil, nil
}

func (t Type) Unmarshal(data []byte, v any) error {
	return nil
}
