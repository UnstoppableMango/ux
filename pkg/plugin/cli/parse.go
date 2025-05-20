package cli

import "fmt"

func Parse(args []string) (i Input, err error) {
	if len(args) == 0 {
		return i, fmt.Errorf("no arguments provided")
	}
	if len(args) >= 1 {
		i.Host = Host(args[0])
	}
	if len(args) >= 2 {
		i.Command, err = ParseCommand(args[1])
	}

	return
}

func ParseCommand(val string) (Command, error) {
	switch val {
	case "register":
		return RegisterCommand, nil
	default:
		return "", fmt.Errorf("unsupported command: %s", val)
	}
}
