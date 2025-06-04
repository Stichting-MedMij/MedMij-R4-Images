using System.Text.RegularExpressions;

namespace Pgo.Backend.ApplicationExtensions;

public static partial class BasePathApplicationBuilderExtensions
{
    /// <summary>
    /// Configures the application to use a custom base path for requests.
    /// Updates the base URI in the index.html file if a custom base path is provided,
    /// and adjusts the application's request pipeline to reflect the base path.
    /// </summary>
    /// <param name="app">The application builder used to configure the app's request pipeline.</param>
    /// <param name="webrootPath">The path to the web root directory containing the application's static files.</param>
    /// <param name="customBasePath">The custom base path to apply to requests.</param>
    /// <returns>The modified <see cref="IApplicationBuilder"/> instance.</returns>
    public static IApplicationBuilder UseCustomBasePath(this IApplicationBuilder app, string webrootPath, string customBasePath)
    {
        if (!string.IsNullOrEmpty(customBasePath))
        {
            if (!string.IsNullOrEmpty(webrootPath))
            {
                string baseUri = customBasePath;
                if (!baseUri.EndsWith('/')) { baseUri += "/"; }

                AddorUpdateBaseOfIndexHTML(webrootPath, baseUri);
            }

            string basePath = customBasePath;
            if (basePath.EndsWith('/')) { basePath = basePath[..^1]; }

            app.UsePathBase(basePath);
            app.Use(async (context, next) =>
            {
                context.Request.PathBase = basePath;
                await next();
            });
        }

        return app;
    }

    /// <summary>
    /// Modifies the "index.html" file in the web root directory to add or update the `<base>` tag with the specified base URL.
    /// If the `<base>` tag exists, it is updated with the new base URL; otherwise, a new `<base>` tag is added inside the `<head>` section.
    /// </summary>
    /// <param name="webRootPath">The path to the web root directory containing the "index.html" file.</param>
    /// <param name="baseUrl">The base URL to set in the `<base>` tag.</param>
    private static void AddorUpdateBaseOfIndexHTML(string webRootPath, string baseUrl)
    {
        var indexFile = Path.Combine(webRootPath, "index.html");
        if (File.Exists(indexFile))
        {
            var htmlContent = File.ReadAllText(indexFile);
            var baseTagRegex = BasePathRegex();
            if (baseTagRegex.IsMatch(htmlContent))
            {
                htmlContent = baseTagRegex.Replace(htmlContent, $"<base href=\"{baseUrl}\">");
            }
            else
            {
                htmlContent = htmlContent.Replace("<head>", $"<head>\n    <base href=\"{baseUrl}\">");
            }
            File.WriteAllText(indexFile, htmlContent);
        }
    }

    [GeneratedRegex(@"<base\s+href\s*=\s*[""'].*?[""']\s*/?>", RegexOptions.IgnoreCase, "nl-NL")]
    private static partial Regex BasePathRegex();
}