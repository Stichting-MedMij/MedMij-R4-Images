namespace Pgo.Backend.Extensions;

public static class FileSizeExtensions
{
	public static string ToHumanReadable(this long? size)
	{
		if (size == null)
		{
			return string.Empty;
		}

		if (size.Value < 0)
		{
			return size.Value.ToString();
		}

		string[] sizeUnits = { "B", "KB", "MB", "GB", "TB", "PB", "EB" };
		int unitIndex = 0;
		double readableSize = size.Value;

		while (readableSize >= 1024 && unitIndex < sizeUnits.Length - 1)
		{
			readableSize /= 1024;
			unitIndex++;
		}

		return $"{readableSize:N2} {sizeUnits[unitIndex]}";
	}
}
