namespace UnMango.Ux.Plugins.Skeleton;

[PublicAPI]
public static class Skel
{
	public static int PluginMain(UxFuncs funcs)
		=> PluginMainAsync(funcs).AsTask().GetAwaiter().GetResult();

	public static int PluginMain(UxFuncs funcs, string[] args, Stream stdin)
		=> PluginMainAsync(funcs, args, stdin).AsTask().GetAwaiter().GetResult();

	public static ValueTask<int> PluginMainAsync(UxFuncs funcs)
		=> PluginMainAsync(funcs, Environment.GetCommandLineArgs(), Console.OpenStandardInput());

	public static async ValueTask<int> PluginMainAsync(UxFuncs funcs, string[] args, Stream stdin) {
		using var cts = new CancellationTokenSource();
		return await funcs.RunAsync(args[1..], stdin, cts.Token);
	}
}
