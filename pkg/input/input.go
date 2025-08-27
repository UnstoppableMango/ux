package input

type File struct {
	Name string
}

func (f File) HasName() bool {
	return f.Name != ""
}
