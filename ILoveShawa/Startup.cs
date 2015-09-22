using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ILoveShawa.Startup))]
namespace ILoveShawa
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
