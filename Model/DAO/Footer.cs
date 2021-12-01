using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class FooterDAO
    {
        SuaBoTotDbContext db = null;
        public FooterDAO()
        {
            db = new SuaBoTotDbContext();
        }
        public Footer GetFooter()
        {
            return db.Footer.SingleOrDefault(x => x.Status == true);
        }
    }
}
