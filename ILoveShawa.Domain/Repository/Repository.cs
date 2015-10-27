using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using ILoveShawa.Domain.IRepository;

namespace ILoveShawa.Domain.Repository
{
    public abstract class Repository<T> : IRepository<T> where T : class
    {
        public abstract T Get(int id);
        public abstract void Delete(int id);

        public IEnumerable<T> Get(Predicate<T> condition)
        {
            using (var container = new ILoveShawaContainer())
            {
                return container.Set<T>().Where(x => condition(x)).ToList();
            }
        }

        public void Add(T element)
        {
            using (var container = new ILoveShawaContainer())
            {
                container.Set<T>().Add(element);
                container.SaveChanges();
            }
        }

        public IEnumerable<T> GetAll()
        {
            using (var container = new ILoveShawaContainer())
            {
                return container.Set<T>().ToList();
            }
        }
    }
}
