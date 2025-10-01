namespace UnMango.Ux.Plugins.Skeleton;

public record struct CmdArgs(IEnumerable<string> Args, Stream StdinData);

public delegate ValueTask UxFunc(CmdArgs args, CancellationToken cancellationToken);

public sealed record UxFuncs(UxFunc Execute, UxFunc Generate)
{
	public static readonly UxFunc NoOp = (_, _) => new();

	public static readonly UxFuncs Default = new(NoOp, NoOp);

	public ValueTask RunAsync(List<string> args, CancellationToken cancellationToken = default)
	{
		return Execute(new(args, Console.OpenStandardInput()), cancellationToken);
	}
}
