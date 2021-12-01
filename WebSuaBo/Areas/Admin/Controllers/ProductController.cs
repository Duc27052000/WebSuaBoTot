using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebSuaBo.Areas.Admin.Controllers
{
    public class ProductController : BaseController
    {
        // GET: Admin/Product
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new ProductDAO();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            return View(model);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Product product)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductDAO();
                long id = dao.Insert(product);
                if (id > 0)
                {
                    return RedirectToAction("Index", "Product");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm sản phẩm thành công");
                }
            }
            return View(product);
        }

        public string ProcessUpload(HttpPostedFileBase file)
        {
            file.SaveAs(Server.MapPath("~/Asset/Admin/img/" + file.FileName));
            return "/Asset/Admin/img/" + file.FileName;
        }

        [HttpGet]
        public ActionResult Edit(long id)
        {
            var product = new ProductDAO().GetByID(id);
            return View(product);
        }

        [HttpPost]
        public ActionResult Edit(Product product)
        {
            if (ModelState.IsValid)
            {

                var dao = new ProductDAO();
                var result = dao.Update(product);
                if (result)
                {
                    return RedirectToAction("Index", "Product");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật sản phẩm thành công");
                }
            }
            return View("Index");
        }

        [HttpDelete]
        public ActionResult Delete(long id)
        {
            new ProductDAO().Delete(id);
            return RedirectToAction("Index");
        }
    }
}