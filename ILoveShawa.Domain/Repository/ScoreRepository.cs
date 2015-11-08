using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ILoveShawa.Domain.Repository
{
    public class ScoreRepository : Repository<Score>
    {
        public override void Delete(int id)
        {
            using (var container = new ILoveShawaContainer())
            {
                container.Scores.RemoveRange(container.Scores.Where(x => x.id == id));
                container.SaveChanges();
            }
        }

        public override Score Get(int id)
        {
            using (var container = new ILoveShawaContainer())
            {
                return container.Scores.FirstOrDefault(x => x.id == id);
            }
        }
    }
}
