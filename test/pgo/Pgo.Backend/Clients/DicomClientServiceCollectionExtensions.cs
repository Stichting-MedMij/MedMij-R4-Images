using IdentityModel.Client;
using Microsoft.Health.Dicom.Client;
using Pgo.Backend.Config;
using System.Net;
using System.Net.Http.Headers;

namespace Pgo.Backend.Clients;

public static class DicomClientServiceCollectionExtensions
{
	public static string DicomHttpClientDvz = nameof(DicomHttpClientDvz);
	public static string DicomTokenHandlerDvz = nameof(DicomTokenHandlerDvz);

	/// <summary>
	/// Register with services.AddDicomClientPgo() in Startup.cs. Simply inject with <see cref="IDicomClientDva"/> in controller.
	/// </summary>
	public static IServiceCollection AddDicomClientPgo(this IServiceCollection services, DvaConfig config)
	{
		// Configure a client for fetching tokens with given client credentials.
		services
			.AddClientCredentialsTokenManagement(options =>
			{
				options.CacheLifetimeBuffer = 60; // default
			})
			.AddClient(DicomTokenHandlerDvz, options =>
			{
				options.ClientCredentialStyle = ClientCredentialStyle.PostBody;
				options.ClientId = config.DicomTokenClientId;
				options.ClientSecret = config.DicomTokenClientSecret;
				options.Scope = config.DicomTokenClientScope;
				options.TokenEndpoint = config.DicomTokenEndpoint;
			});

		// Configure client with a message handler and token handler for DicomClient.
		services
			.AddHttpClient(DicomHttpClientDvz)
			// .AddHttpMessageHandler(() => new DicomClientAcceptHeadersHandler())
			.AddClientCredentialsTokenHandler(DicomTokenHandlerDvz)
			.ConfigurePrimaryHttpMessageHandler(() => new HttpClientHandler()
			{
				AutomaticDecompression = DecompressionMethods.Deflate | DecompressionMethods.GZip
			});			

		// Register the DicomClient as a transient service, but still pool handlers for tokens and sockets.
		services.AddTransient<IDicomClientDva>(context =>
		{
			var httpClient = context
				.GetRequiredService<IHttpClientFactory>()
				.CreateClient(DicomHttpClientDvz);

			httpClient.BaseAddress = new Uri(config.DicomWadoRSEndpoint);
			httpClient.DefaultRequestHeaders.CacheControl = new CacheControlHeaderValue { NoCache = true };

			// Wrap the client in a named service with an interface for dependency injection and tests.
			return new DicomClientDva()
			{
				Client = new DicomWebClient(httpClient, httpClient.BaseAddress.AbsolutePath.Trim('/'))
			};
		});

		return services;
	}

	/// <summary>
	/// Microsoft DicomWebClient sends [Accept: application/dicom] header by default, while our Interoplab
	/// DCM4CHEE test server returns [Content-Type: multipart/related] with [application/dicom] parts as expected.
	/// Such results in a [406 Unacceptable Media Type] error. This handler adds the correct Accept header
	/// while preserving the defaults given by the client. (Finding)
	/// </summary>
	/// <example>AddHttpClient().AddHttpMessageHandler(() => new DicomClientAcceptHeadersHandler())</example>
	public class DicomClientAcceptHeadersHandler : DelegatingHandler
	{
		protected override async Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
		{
			request.Headers.Accept.Add(new(DicomWebConstants.MultipartRelatedMediaType));
			var response = await base.SendAsync(request, cancellationToken);
			//Console.WriteLine($"Request {request}\n\nResponse: {response}");
			return response;
		}
	}
}