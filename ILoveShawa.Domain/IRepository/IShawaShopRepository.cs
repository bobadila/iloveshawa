using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ILoveShawa.Domain.IRepository
{
    interface IShawaShopRepository
    {
        ShawaShop GetShawaShop(int id);

        void AddShawaShop(ShawaShop shawaShop);

        IEnumerable<ShawaShop> GetShawaShops();

        IEnumerable<ShawaShop> GetShawaShops(Predicate<ShawaShop> condition);
    }
}
