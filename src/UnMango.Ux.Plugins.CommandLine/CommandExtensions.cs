using JetBrains.Annotations;
using UnMango.Ux.Plugins.Skeleton;

namespace UnMango.Ux.Plugins.CommandLine;

[PublicAPI]
public static class CommandExtensions
{
	public static void SetAction(this Command command, UxFuncs funcs, Stream stdin)
		=> command.SetAction((parseResult, cancellationToken)
			=> funcs.RunAsync(parseResult, stdin, cancellationToken).AsTask());
}
