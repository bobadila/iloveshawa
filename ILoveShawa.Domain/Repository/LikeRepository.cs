using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ILoveShawa.Domain.Repository
{
    public class LikeRepository : Repository<Like>
    {
        public override void Delete(int id)
        {
            using (var container = new ILoveShawaContainer())
            {
                container.Likes.RemoveRange(container.Likes.Where(x => x.Id == id));
                container.SaveChanges();
            }
        }

        public override Like Get(int id)
        {
            using (var container = new ILoveShawaContainer())
            {
                return container.Likes.FirstOrDefault(x => x.Id == id);
            }
        }
    }
}
