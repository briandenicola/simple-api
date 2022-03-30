var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();
builder.WebHost.UseKestrel(opts =>
{
    opts.ListenAnyIP(5500);
});

var app = builder.Build();
app.MapControllers();
app.Run();
