using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebOnlinePoultry.Startup))]
namespace WebOnlinePoultry
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
