using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;
using Model.ViewModel;

namespace Model.DAO
{
    public class OrderDAO
    {
        SuaBoTotDbContext db = null;
        public OrderDAO()
        {
            db = new SuaBoTotDbContext();
        }

        public long Insert(Order order)
        {
            db.Order.Add(order);
            db.SaveChanges();
            return order.ID;
        }
        public bool Update(Order entity)
        {
            try
            {
                var order = db.Order.Find(entity.ID);
                order.ShipName = entity.ShipName;
                order.ShipMobile = entity.ShipMobile;
                order.ShipAddress = entity.ShipAddress;
                order.ShipEmail = entity.ShipEmail;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }

        }
        public IEnumerable<Order> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Order> model = db.Order;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.ShipName.Contains(searchString));
            }

            return model.OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }
        public Order GetByID(long id)
        {
            return db.Order.Find(id);
        }

        public bool Delete(long id)
        {
            try
            {
                var order = db.Order.Find(id);
                db.Order.Remove(order);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public IEnumerable<OrderDetailViewModel> ListByOrderID(long id, int page, int pageSize)
        {
            var model = (from a in db.Order
                        join b in db.OrderDetail
                         on a.ID equals b.OrderID
                        join c in db.Product
                        on b.ProductID equals c.ID
                        where a.ID == id
                        select new
                        {
                            ShipName = a.ShipName,
                            ProductID = b.ProductID,
                            Name = c.Name,
                            Quantity = b.Quantity,
                            Price = b.Price,
                        }).AsEnumerable().Select(x => new OrderDetailViewModel() {
                            ShipName = x.ShipName,
                            ProductID = x.ProductID,
                            Name = x.Name,
                            Quantity = x.Quantity,
                            Price = x.Price,
                        });
            return model.OrderBy(x => x.ProductID).ToPagedList(page, pageSize);
        }
    }
}
