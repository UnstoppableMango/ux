package internal

import (
	"runtime"
	"runtime/debug"
)

type BuildInfo struct {
	BuildDate string
	GitCommit string
	GoArch    string
	GoOs      string
	GoVersion string
	Version   string
}

func ReadBuildInfo() BuildInfo {
	bi := BuildInfo{
		GoVersion: runtime.Version(),
		GoArch:    runtime.GOARCH,
		GoOs:      runtime.GOOS,
	}

	info, ok := debug.ReadBuildInfo()
	if !ok {
		return bi
	}

	bi.Version = info.Main.Version

	var modified bool
	for _, setting := range info.Settings {
		switch setting.Key {
		case "vcs.revision":
			bi.GitCommit = setting.Value
		case "vcs.time":
			bi.BuildDate = setting.Value
		case "vcs.modified":
			modified = true
		}
	}
	if modified {
		bi.GitCommit += "+DIRTY"
	}

	return bi
}
