using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using WebSuaBo.Model;

namespace WebSuaBo.Controllers
{
    public class CartController : Controller
    {
        private const string CartSession = "CartSession";
        // GET: Cart
        public ActionResult Index()
        {
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }

        public JsonResult Delete(long id)
        {
            var sesionCart = (List < CartItem >) Session[CartSession];
            sesionCart.RemoveAll(x => x.Product.ID == id);
            Session[CartSession] = sesionCart;
            return Json(new
            {
                status = true
            });
        }

        public JsonResult Update(string cartModel)
        {
            var jsonCart = new JavaScriptSerializer().Deserialize<List<CartItem>>(cartModel);
            var sessionCart = (List<CartItem>)Session[CartSession];

            foreach(var item in sessionCart)
            {
                var jsonItem = jsonCart.SingleOrDefault(x => x.Product.ID == item.Product.ID);
                if(jsonItem!= null)
                {
                    item.Quantity = jsonItem.Quantity;
                }
            }
            Session[CartSession] = sessionCart;
            return Json(new
            {
                status = true
            });
        }


        public ActionResult AddItem(long productId, int quantity)
        {
            var product = new ProductDAO().ViewDetail(productId);
            var cart = Session[CartSession];
            if(cart!=null)
            {
                var list = (List<CartItem>)cart;
                if (list.Exists(x => x.Product.ID == productId))
                {
                    foreach (var item in list)
                    {
                        if (item.Product.ID == productId)
                        {
                            item.Quantity += quantity;
                        }
                    }
                }
                else
                {
                    var item = new CartItem();
                    item.Product = product;
                    item.Quantity = quantity;
                    list.Add(item);
                }
                Session[CartSession] = list;
            }
            else
            {
                //Tạo mới đối tượng sản phẩm
                var item = new CartItem();
                item.Product = product;
                item.Quantity = quantity;
                var list = new List<CartItem>();
                list.Add(item);

                Session[CartSession] = list;
            }
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Payment()
        {
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }
        [HttpPost]
        public ActionResult Payment(string billing_last_name, string billing_phone, string billing_email, string billing_address_1)
        {
            var order = new Order();
            order.CreateDate = DateTime.Now;
            order.ShipName = billing_last_name;
            order.ShipMobile = billing_phone;
            order.ShipEmail = billing_email;
            order.ShipAddress = billing_address_1;

            try
            {
                var id = new OrderDAO().Insert(order);
                var cart = (List<CartItem>)Session[CartSession];
                var detailDAO = new OrderDetailDAO();
                foreach (var item in cart)
                {
                    var orderDetail = new OrderDetail();
                    orderDetail.ProductID = item.Product.ID;
                    orderDetail.OrderID = id;
                    orderDetail.Price = item.Product.Price;
                    orderDetail.Quantity = item.Quantity;
                    detailDAO.Insert(orderDetail);
                }
            }
            catch (Exception ex)
            {
                return View();
            }

            return Redirect("/hoan-thanh");
        }

        public ActionResult Success()
        {
            return View();
        }
    }
}