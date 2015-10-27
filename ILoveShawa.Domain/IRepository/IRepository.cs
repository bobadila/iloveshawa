using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ILoveShawa.Domain.IRepository
{
    public interface IRepository<T> where T : class
    {
        T Get(int id);

        void Add(T element);

        void Delete(int id);

        IEnumerable<T> GetAll();

        IEnumerable<T> Get(Predicate<T> condition);
    }
}
