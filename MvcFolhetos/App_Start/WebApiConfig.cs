using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace WebAPI
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Desligar o formatador do XML.
            config.Formatters.Remove(config.Formatters.XmlFormatter);

            // Pretty-print do JSON
            config.Formatters.JsonFormatter.SerializerSettings.Formatting =
                Newtonsoft.Json.Formatting.Indented;

            // Attribute routing toma prioriade sobre conventions-based routing (abaixo).
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}
