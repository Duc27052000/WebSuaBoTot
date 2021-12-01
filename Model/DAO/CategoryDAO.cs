using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class CategoryDAO
    {
        SuaBoTotDbContext db = null;
        public CategoryDAO()
        {
            db = new SuaBoTotDbContext();
        }

        public ProductCategory ViewDetail(long id)
        {
            return db.ProductCategory.Find(id);
        } 
    }
}
