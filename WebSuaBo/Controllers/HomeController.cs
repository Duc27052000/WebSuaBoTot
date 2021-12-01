using Model.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using WebSuaBo.Model;

namespace WebSuaBo.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            ViewBag.ListFeatureProduct = new ProductDAO().ListFeatureProduct(6);
            ViewBag.ListNameProduct_3 = new ProductDAO().ListNameProduct(3);
            ViewBag.ListNameProduct_6 = new ProductDAO().ListNameProduct(6);
            ViewBag.ListNameProduct_18 = new ProductDAO().ListNameProduct(18);
            return View();
        }

        public ActionResult PromotionalProduct()
        {
            return View();
        }

        public ActionResult RedeemPoint()
        {
            ViewBag.ListCreateProduct = new ProductDAO().ListCreateProduct(6);
            return View();
        }

        [ChildActionOnly]
        public PartialViewResult HeaderCart()
        {
            var cart = Session[Common.CommomConstants.CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return PartialView(list);
        }


        [ChildActionOnly]
        public ActionResult Footer()
        {
            var model = new FooterDAO().GetFooter();
            return PartialView(model);
        }
    }
}