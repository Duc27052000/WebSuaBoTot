using Model.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebSuaBo.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index(int page = 1, int pageSize = 10)
        {
            int totalRecord = 0;
            var model = new ProductDAO().ListAllProduct(ref totalRecord, page, pageSize);
            ViewBag.Total = totalRecord;
            ViewBag.Page = page;
            int maxPage = 5;
            int totalPage = 0;
            totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;

            return View(model);
        }

        [ChildActionOnly]
        public PartialViewResult ProductCategory()
        {
            var model = new ProductCategoryDAO().ListAll();
            return PartialView(model);
        }

        public JsonResult ListName(string q)
        {
            var data = new ProductDAO().ListName(q);
            return Json(new
            {
                data = data,
                status = true
            },JsonRequestBehavior.AllowGet); 
        }
        public ActionResult Category(long id,int page = 1, int pageSize = 5)
        {
            var category = new CategoryDAO().ViewDetail(id);
            ViewBag.Category = category;
            int totalRecord = 0; 
            var model = new ProductDAO().ListByCategoryID(id, ref totalRecord, page, pageSize);
            ViewBag.Total = totalRecord;
            ViewBag.Page = page;
            int maxPage = 5;
            int totalPage = 0;
            totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;

            return View(model);
        }

        public ActionResult Search(string keyword, int page = 1, int pageSize = 10)
        {
            ViewBag.Keyword = keyword;
            int totalRecord = 0;
            var model = new ProductDAO().Search(keyword, ref totalRecord, page, pageSize);
            ViewBag.Total = totalRecord;
            ViewBag.Page = page;
            int maxPage = 5;
            int totalPage = 0;
            totalPage = (int)Math.Ceiling((double)(totalRecord / pageSize));
            ViewBag.TotalPage = totalPage;
            ViewBag.MaxPage = maxPage;
            ViewBag.First = 1;
            ViewBag.Last = totalPage;
            ViewBag.Next = page + 1;
            ViewBag.Prev = page - 1;

            return View(model);
        }

        public ActionResult Detail(long id)
        {
            var product = new ProductDAO().ViewDetail(id);
            ViewBag.Category = new ProductCategoryDAO().ViewDetail(product.CategoryID.Value);
            ViewBag.ListCreateProduct = new ProductDAO().ListCreateProduct(6);
            return View(product);
        }
    }


}