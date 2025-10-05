using JetBrains.Annotations;
using UnMango.Ux.Plugins.Skeleton;

namespace UnMango.Ux.Plugins.CommandLine;

[PublicAPI]
public static class CommandExtensions
{
	public static void SetAction(this Command command, UxFuncs funcs)
		=> command.SetAction((parseResult, cancellationToken)
			=> funcs.RunAsync(parseResult, cancellationToken).AsTask());
}
