using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ControladorEstudiantesUniversitarios.Startup))]
namespace ControladorEstudiantesUniversitarios
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
