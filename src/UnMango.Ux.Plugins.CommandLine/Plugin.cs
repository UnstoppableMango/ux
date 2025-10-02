namespace UnMango.Ux.Plugins.CommandLine;

public sealed record Plugin()
{
	public static Command Command()
	{
		return new("");
	}
}
