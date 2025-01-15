using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.OpenIdConnect;
using Microsoft.AspNetCore.HttpOverrides;
using Pgo.Backend.ApplicationExtensions;
using Pgo.Backend.Clients;
using Pgo.Backend.Config;
using Pgo.Backend.Middleware;
using Pgo.Backend.OpenTelemetry;
using Serilog;
using System.IdentityModel.Tokens.Jwt;

namespace Pgo.Backend;

public partial class Startup
{
    public Startup(ConfigurationManager configuration)
    {
        Configuration = configuration;
    }

    public IConfiguration Configuration { get; }

    public void ConfigureServices(IServiceCollection services)
    {
        var pgoConfig = new PgoConfig();
        Configuration.GetSection(nameof(PgoConfig)).Bind(pgoConfig);

		var dvaConfig = new DvaConfig();
		Configuration.GetSection(nameof(DvaConfig)).Bind(dvaConfig);

		var openIdConfig = new OpenIdConnectConfig();
        Configuration.GetSection(nameof(OpenIdConnectConfig)).Bind(openIdConfig);

        if (pgoConfig.IsBehindProxy)
        {
            services.Configure<ForwardedHeadersOptions>(options =>
            {
                options.ForwardedHeaders = ForwardedHeaders.All;
                options.KnownNetworks.Clear();
                options.KnownProxies.Clear();
            });
        }

        JwtSecurityTokenHandler.DefaultMapInboundClaims = false;
        services
            .AddAuthorization()
            .AddBff(); // .AddRemoteApis();

        services
            .AddAuthentication(options =>
            {
                options.DefaultScheme = CookieAuthenticationDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = OpenIdConnectDefaults.AuthenticationScheme;
                options.DefaultSignOutScheme = OpenIdConnectDefaults.AuthenticationScheme;
            })
            .AddCookie(CookieAuthenticationDefaults.AuthenticationScheme)
            .AddOpenIdConnect(OpenIdConnectDefaults.AuthenticationScheme, options =>
            {
                options.Authority = openIdConfig.Authority;
                options.ClientId = openIdConfig.ClientId;
                options.ClientSecret = openIdConfig.ClientSecret;
                options.ResponseType = openIdConfig.ResponseType;
                options.ResponseMode = openIdConfig.ResponseMode;
                options.SaveTokens = openIdConfig.SaveTokens; // Save tokens to cookies or session storage
                options.GetClaimsFromUserInfoEndpoint = openIdConfig.GetClaimsFromUserInfoEndpoint;
                options.RequireHttpsMetadata = openIdConfig.RequireHttpsMetadata;

                foreach (var scope in openIdConfig.Scopes)
                {
                    options.Scope.Add(scope);
                }
            });

        services.Configure<PgoConfig>(Configuration.GetSection(nameof(PgoConfig)));
		services.Configure<DvaConfig>(Configuration.GetSection(nameof(DvaConfig)));

        services.AddFhirClientPgo(pgoConfig);
		services.AddFhirClientDva(dvaConfig);
        services.AddDicomClientPgo(dvaConfig);
		services.AddSignalR();

        services.AddResponseCompression(options =>
        {
            options.EnableForHttps = true; // Optional: Enable compression for HTTPS requests
            options.MimeTypes = [
                "application/javascript",
                "application/json",
                "application/xml",
                "text/css",
                "text/html",
                "text/javascript",
                "text/json",
                "text/plain",
                "text/xml"
            ];
        });

        services.AddControllers();

        services.AddOpenTelemetry(Configuration);
    }

    public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
    {
        var pgoConfig = new PgoConfig();
        Configuration.GetSection(nameof(PgoConfig)).Bind(pgoConfig);

        app.UseCustomBasePath(env.WebRootPath, pgoConfig.BasePath);

        app.UseSerilogRequestLogging();


        if (pgoConfig.IsBehindProxy)
        {
            app.UseForwardedHeaders();
        }

        if (!env.IsDevelopment())
        {
            app.UseExceptionHandler("/Error");
        }

        app.UseResponseCompression();
        app.UseDefaultFiles(new DefaultFilesOptions { DefaultFileNames = ["index.html"] });
        app.UseStaticFiles( new StaticFileOptions
        {
            OnPrepareResponse = ctx =>
            {
				ctx.Context.Response.Headers.Append("Cache-Control", "no-cache, no-store, must-revalidate");
				ctx.Context.Response.Headers.Append("Expires", "0");
				ctx.Context.Response.Headers.Append("Pragma", "no-cache");
			}
        });

		app.UseMiddleware<NoResponseCachingMiddleware>();
		app.UseRouting();
        app.UseAuthentication();
        app.UseBff();
        app.UseAuthorization();

        app.UseEndpoints(route =>
        {
            route.MapBffManagementEndpoints();
            route.MapControllers(); //.AsBffApiEndpoint(); // Use attribute [BffApi] instead for more granular control during debugging.
            route.MapFallbackToFile("index.html");
        });
    }
}