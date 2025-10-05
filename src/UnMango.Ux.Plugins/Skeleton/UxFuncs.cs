namespace UnMango.Ux.Plugins.Skeleton;

[PublicAPI]
public record struct CmdArgs(IReadOnlyList<string> Args, Stream StdinData);

[PublicAPI]
public delegate ValueTask UxFunc(CmdArgs args, CancellationToken cancellationToken);

[PublicAPI]
public sealed record UxFuncs(UxFunc Execute, UxFunc Generate)
{
	public static readonly UxFunc NoOp = (_, _) => new();

	public static readonly UxFuncs Default = new(NoOp, NoOp);

	public int Run(IReadOnlyList<string> args, Stream stdin)
		=> RunAsync(args, stdin).AsTask().GetAwaiter().GetResult();

	public async ValueTask<int> RunAsync(
		IReadOnlyList<string> args,
		Stream stdin,
		CancellationToken cancellationToken = default
	) {
		try {
			await Execute(new(args, stdin), cancellationToken);
		} catch (Exception) {
			return 1;
		}

		return 0;
	}
}
