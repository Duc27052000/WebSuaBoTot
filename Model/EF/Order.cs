namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Order")]
    public partial class Order
    {
        public long ID { get; set; }

        public DateTime? CreateDate { get; set; }

        public long? CustomerID { get; set; }
        [Required(ErrorMessage = "Yêu cầu tên người nhận hàng")]
        [StringLength(50)]
        public string ShipName { get; set; }
        [Required(ErrorMessage = "Yêu cầu nhập số điện thoại")]
        [StringLength(50)]
        public string ShipMobile { get; set; }
        [Required(ErrorMessage = "Yêu cầu nhập địa chỉ ")]
        [StringLength(50)]
        public string ShipAddress { get; set; }
        [Required(ErrorMessage = "Yêu cầu nhập địa chỉ email")]
        [StringLength(50)]
        public string ShipEmail { get; set; }

        public int? Status { get; set; }
    }
}
