package internal

import "fmt"

type CommandBuilder struct {
	command []string
}

func (b *CommandBuilder) Append(values ...any) {
	b.AppendAll(values)
}

func (b *CommandBuilder) AppendAll(values []any) {
	for _, v := range values {
		b.command = append(b.command, fmt.Sprint(v))
	}
}

func (b *CommandBuilder) AppendIf(pred bool, values ...any) {
	if pred {
		b.AppendAll(values)
	}
}

func (b *CommandBuilder) AppendAllIf(pred bool, values []any) {
	if pred {
		b.AppendAll(values)
	}
}

func (b *CommandBuilder) Build() []string {
	return b.command
}

func (b *CommandBuilder) Option(pred bool, name string, opt func() bool) {
	b.AppendIf(pred && opt(), name)
}
