using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;

namespace Model.DAO
{
    public class OrderDetailDAO
    {
        SuaBoTotDbContext db = null;
        public OrderDetailDAO()
        {
            db = new SuaBoTotDbContext();
        }

        public bool Insert(OrderDetail detail)
        {
            try
            {
                db.OrderDetail.Add(detail);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public IEnumerable<OrderDetail> ListAllPaging(int page, int pageSize)
        {
            IQueryable<OrderDetail> model = db.OrderDetail;
            return model.OrderByDescending(x => x.OrderID).ToPagedList(page, pageSize);
        }
    }
}
