namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        public long ID { get; set; }
        [Display(Name = "Tên sản phẩm")]
        [Required(ErrorMessage = "Tên sản phẩm không được để trống")]
        [StringLength(250)]
        public string Name { get; set; }
        [Display(Name = "Mã sản phẩm")]
        [Required(ErrorMessage = "Mã sản phẩm không được để trống")]
        [StringLength(20)]
        public string Code { get; set; }
        [Display(Name = "Tên hiển thị web")]
        [Required(ErrorMessage = "Tên hiển thị web không được để trống")]
        [StringLength(250)]
        public string MetaTitle { get; set; }
        [Display(Name = "Mô tả")]
        [Required(ErrorMessage = "Mô tả không được để trống")]
        public string Descriptions { get; set; }
        [Display(Name = "Hình ảnh")]
        [Required(ErrorMessage = "Hình ảnh không được để trống")]
        [StringLength(250)]
        public string Image { get; set; }
        [Display(Name = "Hình ảnh chi tiết")]
        [Column(TypeName = "xml")]
        public string MoreImages { get; set; }
        [Display(Name = "Giá tiền")]
        [Required(ErrorMessage = "Giá tiền không được để trống")]
        public decimal? Price { get; set; }
        [Display(Name = "Giá khuyến mãi")]
        public decimal? PromotionPrice { get; set; }
        [Display(Name = "Thuế")]
        public bool? IncludeVAT { get; set; }

        public int? Quantity { get; set; }
        [Display(Name = "Mã loại sản phẩm")]
        public long? CategoryID { get; set; }
        [Display(Name = "Chi tiết")]
        [Column(TypeName = "ntext")]
        public string Detail { get; set; }

        public int? Warranty { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(50)]
        public string CreateBy { get; set; }

        public DateTime? ModifileDate { get; set; }

        [StringLength(50)]
        public string ModifileBy { get; set; }

        [StringLength(250)]
        public string MetaKeyword { get; set; }

        [StringLength(250)]
        public string MetaDescriptions { get; set; }

        public bool? Status { get; set; }

        public DateTime? TopHop { get; set; }
        [Display(Name = "Số lượng")]
        public int? ViewCount { get; set; }
    }
}
