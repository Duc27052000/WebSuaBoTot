namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ProductCategory")]
    public partial class ProductCategory
    {
        public long ID { get; set; }
        [Display(Name = "Tên danh mục")]
        [Required(ErrorMessage = "Tên danh mục không được để trống")]
        [StringLength(250)]
        public string Name { get; set; }
        [Display(Name = "Tên hiển thị web")]
        [Required(ErrorMessage = "Tên hiển thị web không được để trống")]
        [StringLength(250)]
        public string MetaTitle { get; set; }
        [Display(Name = "Mã danh mục cha [Nếu có]")]
        public long? ParentID { get; set; }
        [Display(Name = "Danh mục hiển thị cấp")]
        [Required(ErrorMessage = "Tên hiển thị cấp không được để trống")]
        public int? DisplayOrder { get; set; }

        [StringLength(250)]
        public string SeoTitle { get; set; }

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

        public bool? ShowOnHome { get; set; }
    }
}
