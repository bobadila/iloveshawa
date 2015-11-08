using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ILoveShawa.Domain.IRepository;

namespace ILoveShawa.Domain.Repository
{
    public class UserRepository : Repository<User>
    {
        public override void Delete(int id)
        {
            using (var container = new ILoveShawaContainer())
            {
                container.Users.RemoveRange(container.Users.Where(x => x.Id == id));
                container.SaveChanges();
            }
        }

        public override User Get(int id)
        {
            using (var container = new ILoveShawaContainer())
            {
                return container.Users.FirstOrDefault(x => x.Id == id);
            }
        }
    }
}
