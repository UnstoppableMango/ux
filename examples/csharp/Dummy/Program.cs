using System.Text.Json;
using UnMango.Ux.Plugins.Skeleton;

Skel.PluginMain(args, UxFuncs.Default with {
	Execute = (args, _) => {
		Console.WriteLine("Executed with: {0}", JsonSerializer.Serialize(args.Args));
		return ValueTask.CompletedTask;
	},
});
