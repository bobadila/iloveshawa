using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ILoveShawa.Domain.IRepository;

namespace ILoveShawa.Domain.Repository
{
    public class UserRepository : IUserRepository
    {
        public void AddUser(User user)
        {
            using (var container = new ILoveShawaContainer())
            {
                container.Users.Add(user);
            }
        }

        public User GetUser(int id)
        {
            using (var container = new ILoveShawaContainer())
            {
                return container.Users.FirstOrDefault(x => x.id == id);
            }
        }

        public IEnumerable<User> GetUsers()
        {
            using (var container = new ILoveShawaContainer())
            {
                return container.Users.ToList();
            }
        }
    }
}
