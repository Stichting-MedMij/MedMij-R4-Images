using OpenTelemetry.Exporter;
using OpenTelemetry.Metrics;
using OpenTelemetry.Resources;
using OpenTelemetry.Trace;

namespace Pgo.Backend.OpenTelemetry;

public static class OpenTelemetryConfigurationExtensions
{
    public static void AddOpenTelemetry(this IServiceCollection services, IConfiguration configuration)
    {
        ArgumentNullException.ThrowIfNull(configuration);

        var openTelemetryConfig = new OpenTelemetryConfig();
        configuration.GetSection(nameof(OpenTelemetryConfig)).Bind(openTelemetryConfig);

        if (!openTelemetryConfig.Enabled) return;

        services.AddOpenTelemetry()
                .WithTracing(builder => builder.SetResourceBuilder(ResourceBuilder.CreateDefault().AddService(openTelemetryConfig.ServiceName))
                    .AddAspNetCoreInstrumentation()
#if DEBUG
                    .AddConsoleExporter()
#endif
                    .AddOtlpExporter(options =>
                    {
                        options.Endpoint = new Uri(openTelemetryConfig.OTLPEndpoint);
                        options.Protocol = OtlpExportProtocol.Grpc; // Default port 4317
                    })
                );
    }

}