using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;

namespace Model.DAO
{
    public class ProductCategoryDAO
    {
        SuaBoTotDbContext db = null;
        public ProductCategoryDAO()
        {
            db = new SuaBoTotDbContext();
        }

        public List<ProductCategory> ListAll()
        {
            return db.ProductCategory.Where(x => x.Status == true).OrderBy(x => x.DisplayOrder).ToList();
        }
        public long Insert(ProductCategory entity)
        {
            db.ProductCategory.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public bool Update(ProductCategory entity)
        {
            try
            {
                var product = db.ProductCategory.Find(entity.ID);
                product.Name = entity.Name;
                product.MetaTitle = entity.MetaTitle;
                product.ParentID = entity.ParentID;
                product.DisplayOrder = entity.DisplayOrder;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }

        }
        public bool Delete(long id)
        {
            try
            {
                var product = db.ProductCategory.Find(id);
                db.ProductCategory.Remove(product);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public IEnumerable<ProductCategory> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<ProductCategory> model = db.ProductCategory;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString));
            }

            return model.OrderBy(x => x.ID).ToPagedList(page, pageSize);
        }
        public ProductCategory GetByID(long id)
        {
            return db.ProductCategory.Find(id);
        }
        public ProductCategory ViewDetail(long id)
        {
            return db.ProductCategory.Find(id);
        }
    }
}
