using Model.EF;
using Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;

namespace Model.DAO
{
    public class ProductDAO
    {
        SuaBoTotDbContext db = null;
        public ProductDAO()
        {
            db = new SuaBoTotDbContext();
        }

        public long Insert(Product entity)
        {
            db.Product.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }

        public bool Update(Product entity)
        {
            try
            {
                var product = db.Product.Find(entity.ID);
                product.Name = entity.Name;
                product.Code = entity.Code;
                product.MetaTitle = entity.MetaTitle;
                product.Descriptions = entity.Descriptions;
                product.Image = entity.Image;
                product.Price = entity.Price;
                product.PromotionPrice = entity.PromotionPrice;
                product.CategoryID = entity.CategoryID;
                product.Detail = entity.Detail;
                product.Quantity = entity.Quantity;
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
                var product = db.Product.Find(id);
                db.Product.Remove(product);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public Product GetByID(long id)
        {
            return db.Product.Find(id);
        }

        public IEnumerable<Product> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Product> model = db.Product;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString));
            }

            return model.OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }

        public List<string> ListName(string keyword)
        {
            return db.Product.Where(x => x.Name.Contains(keyword)).Select(x => x.Name).ToList();
        }
        public List<Product> ListNewProduct(int top)
        {
            return db.Product.OrderByDescending(x => x.CreateDate).Take(top).ToList();
        }

        public List<Product> ListByCategoryID(long categoryID, ref int totalRecord, int pageIndex = 1, int pageSize = 2)
        {
            totalRecord = db.Product.Where(x => x.CategoryID == categoryID).Count();
            var model = db.Product.Where(x => x.CategoryID == categoryID).OrderByDescending(x => x.CreateDate).Skip((pageIndex - 1) * pageSize).Take(pageSize);
            return model.ToList();
        }
        public List<Product> ListAllProduct(ref int totalRecord, int pageIndex = 1, int pageSize = 10)
        {
            totalRecord = db.Product.Count();
            var model = db.Product.OrderBy(x => x.CreateDate).Skip((pageIndex - 1) * pageSize).Take(pageSize);
            return model.ToList();
        }

        public List<ProductViewModel> Search(string keyword, ref int totalRecord, int pageIndex = 1, int pageSize = 2)
        {
            totalRecord = db.Product.Where(x => x.Name.Contains(keyword)).Count();
            var model = (from a in db.Product
                        join b in db.ProductCategory
                        on a.CategoryID equals b.ID
                        where a.Name.Contains(keyword)
                        select new 
                        {
                            CateMetaTitle = b.MetaTitle,
                            CateName = b.Name,
                            CreateDate = a.CreateDate,
                            ID = a.ID,
                            Image = a.Image,
                            Name = a.Name,
                            MetaTitle = a.MetaTitle,
                            Price = a.Price,
                        }).AsEnumerable().Select(x=>new ProductViewModel() {
                            CateMetaTitle = x.MetaTitle,
                            CateName = x.Name,
                            CreateDate = x.CreateDate,
                            ID = x.ID,
                            Image = x.Image,
                            Name = x.Name,
                            MetaTitle = x.MetaTitle,
                            Price = x.Price,
                        });
            model.OrderByDescending(x => x.CreateDate).Skip((pageIndex - 1) * pageSize).Take(pageSize);
            return model.ToList();
        }

        public List<Product> ListFeatureProduct(int top)
        {
            return db.Product.OrderByDescending(x => x.PromotionPrice).Take(top).ToList();
        }

        public List<Product> ListCreateProduct(int top)
        {
            return db.Product.OrderBy(x => x.CreateDate).Take(top).ToList();
        }

        public List<Product> ListNameProduct(long CategoryID)
        {
            return db.Product.Where(x=>x.CategoryID == CategoryID).OrderBy(x => x.CreateDate).Take(8).ToList();
        }

        public Product ViewDetail(long id)
        {
            return db.Product.Find(id);
        }
    }
}
