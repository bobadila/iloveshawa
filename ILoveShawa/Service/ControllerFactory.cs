using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using ILoveShawa.Domain.IRepository;
using ILoveShawa.Domain.Repository;
using Ninject;

namespace ILoveShawa.Service
{
    public class ControllerFactory : DefaultControllerFactory
    {
        private readonly IKernel kernel;

        public ControllerFactory()
        {
            kernel = new StandardKernel();
            AddBings();
        }

        protected override IController GetControllerInstance(RequestContext requestContext, Type controllerType)
        {
            return controllerType == null ? null : (IController)kernel.Get(controllerType);
        }

        private void AddBings()
        {
            kernel.Bind<IUserRepository>().To<UserRepository>();
            kernel.Bind<IShawaShopRepository>().To<ShawaShopRepository>();
        }
    }
}