module github.com/unstoppablemango/ux/cmd/dummy

go 1.24.3

replace (
	github.com/unstoppablemango/ux => ../../
	github.com/unstoppablemango/ux/sdk => ../../sdk
)

require (
	github.com/unstoppablemango/ux v0.0.0-00010101000000-000000000000
	github.com/unstoppablemango/ux/sdk v0.0.0-00010101000000-000000000000
)

require (
	github.com/inconshreveable/mousetrap v1.1.0 // indirect
	github.com/spf13/afero v1.14.0 // indirect
	github.com/spf13/cobra v1.9.1 // indirect
	github.com/spf13/pflag v1.0.6 // indirect
	github.com/unmango/go v0.3.2 // indirect
	go.uber.org/mock v0.5.2 // indirect
	golang.org/x/net v0.40.0 // indirect
	golang.org/x/sys v0.33.0 // indirect
	golang.org/x/text v0.25.0 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20250505200425-f936aa4a68b2 // indirect
	google.golang.org/grpc v1.72.2 // indirect
	google.golang.org/protobuf v1.36.6 // indirect
)
