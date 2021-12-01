using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebSuaBo.Areas.Admin.Controllers
{
    public class ProductCategoryController : BaseController
    {
        // GET: Admin/ProductCategory
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new ProductCategoryDAO();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            return View(model);
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(ProductCategory productCategory)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductCategoryDAO();
                long id = dao.Insert(productCategory);
                if (id > 0)
                {
                    return RedirectToAction("Index", "Product");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm danh mục thành công");
                }
            }
            return View(productCategory);
        }
        [HttpGet]
        public ActionResult Edit(long id)
        {
            var product = new ProductCategoryDAO().GetByID(id);
            return View(product);
        }

        [HttpPost]
        public ActionResult Edit(ProductCategory productCategory)
        {
            if (ModelState.IsValid)
            {

                var dao = new ProductCategoryDAO();
                var result = dao.Update(productCategory);
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
            new ProductCategoryDAO().Delete(id);
            return RedirectToAction("Index");
        }

    }
}