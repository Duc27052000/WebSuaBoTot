using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebSuaBo.Areas.Admin.Controllers
{
    public class OrderController : BaseController
    {
        // GET: Admin/Order

        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new OrderDAO();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            return View(model);
        }
        [HttpGet]
        public ActionResult Edit(long id)
        {
            var order = new OrderDAO().GetByID(id);
            return View(order);
        }

        [HttpPost]
        public ActionResult Edit(Order order)
        {
            if (ModelState.IsValid)
            {

                var dao = new OrderDAO();
                var result = dao.Update(order);
                if (result)
                {
                    return RedirectToAction("Index", "Order");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật thông tin mua hàng");
                }
            }
            return View("Index");
        }

        [HttpDelete]
        public ActionResult Delete(long id)
        {
            new ProductCategoryDAO().Delete(id);
            return RedirectToAction("Index");
        }

        public ActionResult OrderDetail(long id, int page = 1, int pageSize = 10)
        {
            var dao = new OrderDAO();
            var model = dao.ListByOrderID(id, page, pageSize);
            return View(model);
        }

    }
}