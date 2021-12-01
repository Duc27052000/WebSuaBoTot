using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebSuaBo.Model
{
    public class AccoutModel
    {
        [Key]
        public long ID { set; get; }
        [Display(Name= "Tên tài khoản")]
        [Required(ErrorMessage ="Yêu cầu nhập tên tài khoản")]
        public string UserName { set; get; }

        [Display(Name = "Địa chỉ email")]
        [Required(ErrorMessage = "Yêu cầu nhập địa chỉ email")]
        public string Email { set; get; }


    }
}