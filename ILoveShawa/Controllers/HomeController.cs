using System;
using System.Collections.Generic;
using System.Web.Mvc;
using ILoveShawa.Domain;
using ILoveShawa.Domain.IRepository;
using System.Device.Location;
using System.Linq;
using System.Web.Script.Serialization;
using System.Web.UI;

namespace ILoveShawa.Controllers
{
    public class HomeController : Controller
    {
        static HomeController()
        {
        }
        private readonly IRepository<ShawaShop> shawaShopRepository;
        public HomeController(IRepository<ShawaShop> shawaShopRepository)
        {
            this.shawaShopRepository = shawaShopRepository;
        }

        public ActionResult Index()
        {
            var showindShops = shawaShopRepository.GetAll();
            return View(showindShops);
        }

        public ActionResult ShawaShop(int id = -1)
        {
            var shawaShop = shawaShopRepository.Get(id);
            if (shawaShop != null)
            {
                return View(shawaShop);
            }
            return RedirectToAction("Index");
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