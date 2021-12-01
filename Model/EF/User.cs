namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("User")]
    public partial class User
    {
        public long ID { get; set; }

        [StringLength(50)]
        [Display(Name = "Tài khoản")]
        [Required(ErrorMessage = "Tài khoản không được để trống")]
        public string UserName { get; set; }

        [StringLength(32)]
        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Mất khẩu không được để trống")]
        public string PassWord { get; set; }

        [StringLength(50)]
        [Display(Name = "Họ và tên")]
        [Required(ErrorMessage = "Họ và tên không được để trống")]
        public string Name { get; set; }

        [StringLength(20)]
        public string GroupID { get; set; }

        [StringLength(50)]
        [Display(Name = "Địa chỉ")]
        public string Address { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(50)]
        [Display(Name = "Số điện thoại")]
        public string Phone { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(50)]
        public string CreateBy { get; set; }

        public DateTime? ModifileDate { get; set; }

        [StringLength(50)]
        public string ModifileBy { get; set; }

        public bool Status { get; set; }
    }
}
