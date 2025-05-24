package cmd

var rootCmd = NewUx()

func Execute() error {
	return rootCmd.Execute()
}
