using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ILoveShawa.Domain.IRepository;

namespace ILoveShawa.Controllers
{
    public class HomeController : Controller
    {
        private readonly IShawaShopRepository shawaShopRepository;
        public HomeController(IShawaShopRepository shawaShopRepository)
        {
            this.shawaShopRepository = shawaShopRepository;
        }

        public ActionResult Index()
        {
            var h = shawaShopRepository.GetShawaShops().Count();
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}