using Hl7.Fhir.Rest;
using Pgo.Backend.Config;
using System.Net;
using System.Net.Http.Headers;

namespace Pgo.Backend.Clients;

public static class FhirClientServiceCollectionExtensions
{
	public static string FhirHttpClientPgo = nameof(FhirHttpClientPgo);
	public static string FhirHttpClientDva = nameof(FhirHttpClientDva);

	/// <summary>
	/// Register with services.AddFhirClientPgo() in Startup.cs. Simply inject with <see cref="IFhirClientPgo"/> in controller.
	/// </summary>
	public static IServiceCollection AddFhirClientPgo(this IServiceCollection services, PgoConfig config)
	{
		// Configure client for JSON messages and avoid calling /metadata on every request.
		var settings = new FhirClientSettings
		{
			PreferredFormat = ResourceFormat.Json,
			VerifyFhirVersion = false,
			PreferredParameterHandling = SearchParameterHandling.Strict
		};

		// Configure messagehandler with defaults for FhirClient.
		services
			.AddHttpClient(FhirHttpClientPgo)
			.ConfigurePrimaryHttpMessageHandler(() => new HttpClientHandler()
			{
				AutomaticDecompression = DecompressionMethods.Deflate | DecompressionMethods.GZip
			});

		// Register the FhirClient as a transient service, but still with pooled socket handlers.
		services.AddTransient<IFhirClientPgo>(context =>
		{
			var httpClient = context
				.GetRequiredService<IHttpClientFactory>()
				.CreateClient(FhirHttpClientPgo);

			httpClient.DefaultRequestHeaders.CacheControl = new CacheControlHeaderValue
			{
				NoCache = true
			};

			// Wrap the client in a named service with an interface for dependency injection and tests.
			return new FhirClientPgo()
			{
				Client = new FhirClient(config.FhirEndpoint, httpClient, settings)
			};
		});

		return services;
	}

	/// <summary>
	/// Register with services.AddFhirClientDva() in Startup.cs; Simply inject <see cref="IFhirClientDva"/> in controller.
	/// </summary>
	public static IServiceCollection AddFhirClientDva(this IServiceCollection services, DvaConfig config)
	{
		// Configure client for JSON messages and avoid calling /metadata on every request.
		var settings = new FhirClientSettings
		{
			PreferredFormat = ResourceFormat.Json,
			VerifyFhirVersion = true,
			PreferredParameterHandling = SearchParameterHandling.Strict,
		};

		// Configure messagehandler with defaults for FhirClient.
		services
			.AddHttpClient(FhirHttpClientDva)
			.ConfigurePrimaryHttpMessageHandler(() => new HttpClientHandler()
			{
				AutomaticDecompression = DecompressionMethods.Deflate | DecompressionMethods.GZip
			});

		// Register the FhirClient as a transient service, but still with pooled socket handlers.
		services.AddTransient<IFhirClientDva>(context =>
		{
			var httpClient = context
				.GetRequiredService<IHttpClientFactory>()
				.CreateClient(FhirHttpClientDva);

			httpClient.DefaultRequestHeaders.CacheControl = new CacheControlHeaderValue
			{
				NoCache = true
			};

			// Wrap the client in a named service with an interface for dependency injection and tests.
			return new FhirClientDva()
			{
				Client = new FhirClient(config.FhirEndpoint, httpClient, settings)
			};
		});

		return services;
	}
}