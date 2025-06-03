package media

import "mime"

func ExtensionsByType(typ Type) ([]string, error) {
	return mime.ExtensionsByType(string(typ))
}

func TypeByExtension(ext string) Type {
	return Type(mime.TypeByExtension(ext))
}
