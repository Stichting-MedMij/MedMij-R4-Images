using Serilog;
using Serilog.Formatting.Json;
using Serilog.Sinks.SystemConsole.Themes;
using System.Globalization;

namespace Pgo.Backend;

public class Program
{
    public static int Main(string[] args)
    {
        bool migrate = args.Contains("/migrate");
        if (migrate)
        {
			Log.Information("This application doesn't maintain a local database. Migrations not applied.");
            return 0;
		}

        IFormatProvider logFormatProvider = CultureInfo.InvariantCulture;

        Log.Logger = new LoggerConfiguration()
            .WriteTo.Console(formatProvider: logFormatProvider)
            .CreateBootstrapLogger();
        Log.Information("Start pgo-beeldinpgo with AppVersion: {0}", AppVersion);

        try
        {
            var builder = CreateWebApplicationBuilder(args);
            var startup = new Startup(builder.Configuration);
            startup.ConfigureServices(builder.Services);

            var app = builder.Build();
            startup.Configure(app, app.Environment);

            app.Run();
            return 0;
        }
        catch (Exception ex)
        {
            Log.Fatal(ex, "Unhandled exception");
            return 1;
        }
        finally
        {
            Log.Information("Shut down complete");
            Log.CloseAndFlush();
        }
    }

    private static WebApplicationBuilder CreateWebApplicationBuilder(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);
        builder.Host.UseSerilog((hostContext, config) => ConfigureSerilog(hostContext, config))
                    .ConfigureAppConfiguration((hostContext, config) => AddConfiguration(hostContext, config, args));

        return builder;
    }

    private static void AddConfiguration(HostBuilderContext _, IConfigurationBuilder config, string[] args)
    {
        var currentDirectory = Directory.GetCurrentDirectory();
        var configFile = Environment.GetEnvironmentVariable("CONFIG_FILE_PATH") ?? $"{currentDirectory}/config.yaml";
        config.AddYamlFile(configFile, optional: false, reloadOnChange: false);

        config.AddEnvironmentVariables();

        if (args != null)
        {
            config.AddCommandLine(args);
        }
    }

    private static void ConfigureSerilog(HostBuilderContext ctx, LoggerConfiguration config)
    {
        config.ReadFrom.Configuration(ctx.Configuration)
              .Enrich.FromLogContext();

        IFormatProvider logFormatProvider = CultureInfo.InvariantCulture;
        if (Convert.ToBoolean(ctx.Configuration["Serilog:NoJsonLogging"], provider: logFormatProvider))
        {
            const string plainTextFormat = "[{Timestamp:HH:mm:ss} {Level}] {SourceContext}{NewLine}{Message:lj}{NewLine}{Exception}{NewLine}";
            config.WriteTo.Console(outputTemplate: plainTextFormat, theme: AnsiConsoleTheme.Literate, formatProvider: logFormatProvider);
        }
        else
        {
            config.WriteTo.Console(new JsonFormatter());
        }
    }

    private static string AppVersion
    {
        get
        {
            string appVersionFile = $"{Directory.GetCurrentDirectory()}/appversion";
            string version;
            if (File.Exists(appVersionFile))
            {
                version = File.ReadAllText(appVersionFile);
            }
            else
            {
                string now = DateTime.Now.ToString("s", CultureInfo.InvariantCulture);
                version = $"0.0.{now}.LOCALBUILD"; // Dummy version for local development
            }
            return version;
        }
    }

}