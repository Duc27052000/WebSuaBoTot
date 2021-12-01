using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace WebSuaBo
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Product Category",
                url: "san-pham/{metatitle}-{id}",
                defaults: new { controller = "Product", action = "Category", id = UrlParameter.Optional },
                namespaces: new[] { "WebSuaBo.Controllers" }

            
            );

            routes.MapRoute(
                name: "Product Detail",
                url: "chi-tiet/{metatitle}-{id}",
                defaults: new { controller = "Product", action = "Detail", id = UrlParameter.Optional },
                namespaces: new[] { "WebSuaBo.Controllers" }


            );

            routes.MapRoute(
            name: "Product",
            url: "san-pham",
            defaults: new { controller = "Product", action = "Index", id = UrlParameter.Optional },
            namespaces: new[] { "WebSuaBo.Controllers" }
            );

            routes.MapRoute(
                 name: "About",
                 url: "gioi-thieu",
                defaults: new { controller = "About", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "WebSuaBo.Controllers" }
            );

            routes.MapRoute(
            name: "PromotionalProduct",
            url: "khuyen-mai-qua-tang",
            defaults: new { controller = "Home", action = "PromotionalProduct", id = UrlParameter.Optional },
            namespaces: new[] { "WebSuaBo.Controllers" }
            );

            routes.MapRoute(
            name: "RedeemPoint",
            url: "tich-diem-doi-qua",
            defaults: new { controller = "Home", action = "RedeemPoint", id = UrlParameter.Optional },
            namespaces: new[] { "WebSuaBo.Controllers" }
            );

            routes.MapRoute(
            name: "Search",
             url: "tim-kiem",
            defaults: new { controller = "Product", action = "Search", id = UrlParameter.Optional },
            namespaces: new[] { "WebSuaBo.Controllers" }
            );

            routes.MapRoute(
             name: "Payment",
            url: "thanh-toan",
            defaults: new { controller = "Cart", action = "Payment", id = UrlParameter.Optional },
            namespaces: new[] { "WebSuaBo.Controllers" }
            );

            routes.MapRoute(
            name: "Payment Success",
            url: "hoan-thanh",
            defaults: new { controller = "Cart", action = "Success", id = UrlParameter.Optional },
            namespaces: new[] { "WebSuaBo.Controllers" }
            );

            routes.MapRoute(
                    name: "Home",
                  url: "trang-chu",
                 defaults: new { controller = "Home", action = "Index"},
                namespaces: new[] { "WebSuaBo.Controllers" }
            );

            routes.MapRoute(
            name: "Account",
            url: "tai-khoan",
            defaults: new { controller = "User", action = "Account", id = UrlParameter.Optional },
            namespaces: new[] { "WebSuaBo.Controllers" }
            );

            routes.MapRoute(
            name: "Cart",
            url: "gio-hang",
            defaults: new { controller = "Cart", action = "Index" ,id = UrlParameter.Optional },
            namespaces: new[] { "WebSuaBo.Controllers" }
            );

            routes.MapRoute(
            name: "Add cart",
            url: "them-gio-hang",
            defaults: new { controller = "Cart", action = "AddItem" },
            namespaces: new[] { "WebSuaBo.Controllers" }


            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "WebSuaBo.Controllers" }
            );
        }
    }
}
