using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebSuaBo.Areas.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage ="Tên đăng nhập không được để trống")]
        public string UserName { get; set; }
        [Required(ErrorMessage = "Mật khẩu không được để trống")]
        public string PassWord { get; set; }
        public bool RememberMe { get; set; }
    }
}