using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ILoveShawa.Domain.Repository
{
    public class ImageRepository : Repository<Image>
    {
        public override void Delete(int id)
        {
            using (var container = new ILoveShawaContainer())
            {
                container.Images.RemoveRange(container.Images.Where(x => x.Id == id));
                container.SaveChanges();
            }
        }

        public override Image Get(int id)
        {
            using (var container = new ILoveShawaContainer())
            {
                return container.Images.FirstOrDefault(x => x.Id == id);
            }
        }
    }
}
