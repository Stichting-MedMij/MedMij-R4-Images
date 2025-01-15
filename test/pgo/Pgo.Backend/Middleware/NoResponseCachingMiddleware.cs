using Microsoft.AspNetCore.Http;
using System.Threading.Tasks;

namespace Pgo.Backend.Middleware;
public class NoResponseCachingMiddleware
{
	private readonly RequestDelegate _next;

	public NoResponseCachingMiddleware(RequestDelegate next)
	{
		_next = next;
	}

	public async Task InvokeAsync(HttpContext context)
	{
		context.Response.OnStarting(() =>
		{
			context.Response.Headers["Cache-Control"] = "no-store, no-cache, must-revalidate, max-age=0";
			context.Response.Headers["Pragma"] = "no-cache";
			context.Response.Headers["Expires"] = "0";
			return Task.CompletedTask;
		});

		await _next(context);
	}
}
