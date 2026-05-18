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
	Links    []Link              `yaml:"links"`
	Builders map[string]string   `yaml:"builders"`
	Generate map[string]Generate `yaml:"generate"`
}

type Generate struct {
	Builder string          `yaml:"builder"`
	Config  *GenerateConfig `yaml:"config"`
}

func (c *Generate) GetConfig() []byte {
	if c.Config == nil {
		return nil
	}
	return c.Config.Get()
}

type GenerateConfig struct {
	data []byte
}

func (c *GenerateConfig) Get() []byte {
	return c.data
}
