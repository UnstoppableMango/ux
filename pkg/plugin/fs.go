package plugin

import (
	"github.com/spf13/afero"
	"github.com/unmango/aferox/mapped"
)

func NewFs(input afero.Fs) (output, fs afero.Fs) {
	output = afero.NewMemMapFs()
	return output, mapped.NewFs(map[string]afero.Fs{
		"input":  input,
		"output": output,
	})
}
