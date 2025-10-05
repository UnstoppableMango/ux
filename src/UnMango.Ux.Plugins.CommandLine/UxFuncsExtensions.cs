using JetBrains.Annotations;
using UnMango.Ux.Plugins.Skeleton;

namespace UnMango.Ux.Plugins.CommandLine;

[PublicAPI]
public static class UxFuncsExtensions
{
	public static ValueTask<int> RunAsync(
		this UxFuncs funcs,
		ParseResult parseResult,
		Stream stdin,
		CancellationToken cancellationToken = default
	) => funcs.RunAsync(parseResult.UnmatchedTokens, stdin, cancellationToken);

	public static void Configure(this UxFuncs funcs, Command command, Stream stdin)
		=> command.SetAction(funcs, stdin);
}
