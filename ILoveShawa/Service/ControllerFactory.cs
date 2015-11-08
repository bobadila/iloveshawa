using System;
using System.Web.Mvc;
using System.Web.Routing;
using ILoveShawa.Domain;
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
            kernel.Bind<IRepository<ShawaShop>>().To<ShawaShopRepository>();
            kernel.Bind<IRepository<User>>().To<UserRepository>();
            kernel.Bind<IRepository<Image>>().To<ImageRepository>();
            kernel.Bind<IRepository<Like>>().To<LikeRepository>();
            kernel.Bind<IRepository<Review>>().To<ReviewRepository>();
            kernel.Bind<IRepository<Score>>().To<ScoreRepository>();
        }
    }
}