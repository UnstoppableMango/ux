module github.com/unstoppablemango/ux/cmd/dummy

go 1.24.4

replace (
	github.com/unstoppablemango/ux => ../../
	github.com/unstoppablemango/ux/sdk => ../../sdk
)

require (
	github.com/charmbracelet/log v0.4.2
	github.com/unstoppablemango/ux v0.0.0-00010101000000-000000000000
	github.com/unstoppablemango/ux/sdk v0.0.0-00010101000000-000000000000
	google.golang.org/grpc v1.73.0
)

require (
	buf.build/gen/go/unmango/protofs/grpc/go v1.5.1-20250613050322-304b4fb5d9b0.2 // indirect
	buf.build/gen/go/unmango/protofs/protocolbuffers/go v1.36.6-20250613050322-304b4fb5d9b0.1 // indirect
	github.com/aymanbagabas/go-osc52/v2 v2.0.1 // indirect
	github.com/charmbracelet/colorprofile v0.3.1 // indirect
	github.com/charmbracelet/lipgloss v1.1.0 // indirect
	github.com/charmbracelet/x/ansi v0.9.2 // indirect
	github.com/charmbracelet/x/cellbuf v0.0.13 // indirect
	github.com/charmbracelet/x/term v0.2.1 // indirect
	github.com/go-logfmt/logfmt v0.6.0 // indirect
	github.com/inconshreveable/mousetrap v1.1.0 // indirect
	github.com/lucasb-eyer/go-colorful v1.2.0 // indirect
	github.com/mattn/go-isatty v0.0.20 // indirect
	github.com/mattn/go-runewidth v0.0.16 // indirect
	github.com/muesli/termenv v0.16.0 // indirect
	github.com/rivo/uniseg v0.4.7 // indirect
	github.com/spf13/afero v1.14.0 // indirect
	github.com/spf13/cobra v1.9.1 // indirect
	github.com/spf13/pflag v1.0.6 // indirect
	github.com/unmango/aferox/protofs v0.0.7 // indirect
	github.com/unmango/go v0.5.1 // indirect
	github.com/xo/terminfo v0.0.0-20220910002029-abceb7e1c41e // indirect
	golang.org/x/exp v0.0.0-20250606033433-dcc06ee1d476 // indirect
	golang.org/x/net v0.41.0 // indirect
	golang.org/x/sys v0.33.0 // indirect
	golang.org/x/text v0.26.0 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20250603155806-513f23925822 // indirect
	google.golang.org/protobuf v1.36.6 // indirect
	k8s.io/utils v0.0.0-20250604170112-4c0f3b243397 // indirect
)
