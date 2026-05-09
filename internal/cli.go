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

func (b *CommandBuilder) AppendMap(option string, values map[string]string) {
	for name, value := range values {
		b.Append(option, name, value)
	}
}

func (b *CommandBuilder) Arg(name string, pred func() bool, value func() any) {
	b.AppendIf(pred(), name, value())
}

func (b *CommandBuilder) Build() []string {
	return b.command
}

func (b *CommandBuilder) Option(pred bool, name string, opt func() bool) {
	b.AppendIf(pred && opt(), name)
}

func (b *CommandBuilder) Opt(name string, has, get func() bool) {
	b.AppendIf(has() && get(), name)
}

func AppendAll[S []T, T any](b *CommandBuilder, values S) {
	for _, v := range values {
		b.Append(v)
	}
}

func AppendOpts[S []T, T any](b *CommandBuilder, name string, get func() S) {
	for _, v := range get() {
		b.Append(name, v)
	}
}
