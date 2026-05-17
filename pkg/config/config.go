package config

type Derivation struct {
	Path *string `yaml:"path"`
}

type Destination struct {
	RelativePath *string `yaml:"relative_path"`
}

type Link struct {
	Name        *string      `yaml:"name"`
	Derivation  *Derivation  `yaml:"derivation"`
	Destination *Destination `yaml:"destination"`
}

type Config struct {
	Links []Link `yaml:"links"`
}
