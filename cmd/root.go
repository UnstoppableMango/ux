package cmd

var (
	root = NewUx()
)

func Execute() error {
	return root.Execute()
}

func init() {
	plugin := NewPlugin()
	plugin.AddCommand(NewConformance())

	root.AddCommand(
		NewCli(),
		NewGenerate(),
		plugin,
	)
}
