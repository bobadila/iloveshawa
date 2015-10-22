using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace ILoveShawa.Domain.IRepository
{
    public interface IShawaShopRepository
    {
        ShawaShop GetShawaShop(int id);

        void AddShawaShop(ShawaShop shawaShop);

        IEnumerable<ShawaShop> GetShawaShops();

        IEnumerable<ShawaShop> GetShawaShops(Predicate<ShawaShop> condition);
    }
}
