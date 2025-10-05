using JetBrains.Annotations;
using UnMango.Ux.Plugins.Skeleton;

namespace UnMango.Ux.Plugins.CommandLine;

[PublicAPI]
public static class UxFuncsExtensions
{
	public static ValueTask RunAsync(this UxFuncs funcs, ParseResult parseResult, CancellationToken cancellationToken)
		=> funcs.RunAsync(parseResult.UnmatchedTokens, cancellationToken);

	public static RootCommand RootCommand(this UxFuncs funcs) {
		var command = new RootCommand();
		funcs.Configure(command);
		return command;
	}

	public static Command Command(this UxFuncs funcs, string name, string? description = null) {
		var command = new Command(name, description);
		funcs.Configure(command);
		return command;
	}

	public static void Configure(this UxFuncs funcs, Command command)
		=> command.SetAction(funcs);
}
