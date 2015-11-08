using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ILoveShawa.Domain.Repository
{
    public class ReviewRepository : Repository<Review>
    {
        public override void Delete(int id)
        {
            using (var container = new ILoveShawaContainer())
            {
                container.Reviews.RemoveRange(container.Reviews.Where(x => x.Id == id));
                container.SaveChanges();
            }
        }

        public override Review Get(int id)
        {
            using (var container = new ILoveShawaContainer())
            {
                return container.Reviews.FirstOrDefault(x => x.Id == id);
            }
        }
    }
}
