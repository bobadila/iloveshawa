using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ILoveShawa.Domain.IRepository;
using System.Data.Entity;

namespace ILoveShawa.Domain.Repository
{
    public class ShawaShopRepository : Repository<ShawaShop>
    {
        public override void Delete(int id)
        {
            using (var container = new ILoveShawaContainer())
            {
                container.ShawaShops.RemoveRange(container.ShawaShops.Where(x => x.id == id));
                container.SaveChanges();
            }
        }

        public override ShawaShop Get(int id)
        {
            using (var container = new ILoveShawaContainer())
            {
                return container.ShawaShops.FirstOrDefault(x => x.id == id);
            }
        }
    }
}
