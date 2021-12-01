using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Common;
using Model.EF;
using PagedList;

namespace Model.DAO
{
    public class UserDAO
    {
        SuaBoTotDbContext db = null;
        public UserDAO()
        {
            db = new SuaBoTotDbContext();
        }
        public long Insert(User entity)
        {
            db.User.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }

        public bool Update(User entity)
        {
            try
            {
                var user = db.User.Find(entity.ID);
                user.UserName = entity.UserName;
                if (!string.IsNullOrEmpty(entity.PassWord))
                {
                    user.PassWord = entity.PassWord;
                }
                user.Name = entity.Name;
                user.Address = entity.Address;
                user.Email = entity.Email;
                user.ModifileBy = entity.ModifileBy;
                user.ModifileDate = DateTime.Now;
                db.SaveChanges();
                return true;
            }
            catch(Exception ex)
            {
                return false;
            }

        }

        public IEnumerable<User> ListAllPaging(string searchString,int page ,int pageSize)
        {
            IQueryable<User> model = db.User;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.UserName.Contains(searchString) || x.Name.Contains(searchString));
            }

            return model.OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }
        public User GetByUserName(string userName)
        {
            return db.User.SingleOrDefault(x=>x.UserName == userName);
        }

        public User GetByID(int id)
        {
            return db.User.Find(id);
        }
        public int Login(string userName, string passWord, bool isLoginAdmin = false)
        {
            var result = db.User.SingleOrDefault(x => x.UserName == userName);
            if (result == null)
            {
                return 0;
            }
            else
            {
                if (isLoginAdmin == true)
                {
                    if (result.GroupID == CommonConstants.ADMIN_GROUP || result.GroupID == CommonConstants.MEMBER_GROUP)
                    {
                        if (result.Status == false)
                        {
                            return -1;
                        }
                        else
                        {
                            if (result.PassWord == passWord)
                                return 1;
                            else
                                return -2;
                        }
                    }
                    else
                    {
                        return -3;
                    }
                }
                else
                {
                    if (result.Status == false)
                    {
                        return -1;
                    }
                    else
                    {
                        if (result.PassWord == passWord)
                            return 1;
                        else
                            return -2;
                    }
                }
            }
        }

        public List<string> GetListCredential(string userName)
        {
            var user = db.User.Single(x => x.UserName == userName);
            var data = (from a in db.Credential
                        join b in db.UserGroup on a.UserGroupID equals b.ID
                        join c in db.Role on a.RoleID equals c.ID
                        where b.ID == user.GroupID
                        select new
                        {
                            RoleID = a.RoleID,
                            UserGroupID = a.UserGroupID
                        }).AsEnumerable().Select(x => new Credential()
                        {
                            RoleID = x.RoleID,
                            UserGroupID = x.UserGroupID
                        });
            return data.Select(x => x.RoleID).ToList();

        }

        public bool Delete(int id)
        {
            try
            {
                var user = db.User.Find(id);
                db.User.Remove(user);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool CheckUserName (string username)
        {
            return db.User.Count(x => x.UserName == username) > 0;
        }
        public bool CheckEmail (string email)
        {
            return db.User.Count(x => x.Email == email) > 0;
        }
    }
}
