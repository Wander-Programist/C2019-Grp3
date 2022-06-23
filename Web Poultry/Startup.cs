using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Web_Poultry.Startup))]
namespace Web_Poultry
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
