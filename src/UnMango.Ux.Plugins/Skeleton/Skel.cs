namespace UnMango.Ux.Plugins.Skeleton;

[PublicAPI]
public static class Skel
{
	public static void PluginMain(string[] args, UxFuncs funcs)
		=> PluginMainAsync(args, funcs).AsTask().GetAwaiter().GetResult();

	public static async ValueTask PluginMainAsync(string[] args, UxFuncs funcs) {
		using var cts = new CancellationTokenSource();
		await funcs.RunAsync(args[1..], cts.Token);
	}
}
