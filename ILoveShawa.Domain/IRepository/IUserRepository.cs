﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ILoveShawa.Domain.IRepository
{
    public interface IUserRepository
    {
        User GetUser(int id);

        void AddUser(User user);

        IEnumerable<User> GetUsers();
    }
}
