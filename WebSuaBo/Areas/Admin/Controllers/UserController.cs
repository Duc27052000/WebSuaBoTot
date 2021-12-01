using Model.DAO;
using Model.EF;
using WebSuaBo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebSuaBo.Areas.Admin.Controllers
{
    public class UserController : BaseController
    {
        // GET: Admin/User
        [HasCredential(RoleID="VIEW_USER")]
        public ActionResult Index(string searchString, int page = 1,int pageSize = 10)
        {
            var dao = new UserDAO();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            return View(model);
        }
        [HttpGet]
        [HasCredential(RoleID = "ADD_USER")]
        public ActionResult Create()
        {
            return View();
        }
        [HttpGet]
        [HasCredential(RoleID = "EDIT_USER")]
        public ActionResult Edit(int id)
        {
            var user = new UserDAO().GetByID(id);
            return View(user);
        }
        [HttpPost]
        [HasCredential(RoleID = "ADD_USER")]
        public ActionResult Create(User user)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDAO();
                long id = dao.Insert(user);
                if (id > 0)
                {
                    return RedirectToAction("Index", "User");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm người dùng thành công");
                }
            }
            return View(user);
        }
        [HttpPost]
        [HasCredential(RoleID = "EDIT_USER")]
        public ActionResult Edit(User user)
        {
            if (ModelState.IsValid)
            {
               
                var dao = new UserDAO();
                var result = dao.Update(user);
                if (result)
                {
                    return RedirectToAction("Index", "User");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật người dùng thành công");
                }
            }
            return View("Index");
        }
        [HttpDelete]
        [HasCredential(RoleID = "DELETE_USER")]
        public ActionResult Delete(int id)
        {
            new UserDAO().Delete(id);
            return RedirectToAction("Index");
        }

    }
}