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
        public class _ShawaShop
        {
            public readonly int Id;
            public readonly string Name;
            public readonly GeoCoordinate Coord;

            private static int maxId;

            public _ShawaShop(string name, GeoCoordinate coord)
            {
                Id = maxId++;
                Name = name;
                Coord = coord;
            }
        }

        private static readonly List<_ShawaShop> testShawaShops = new List<_ShawaShop>();
        static HomeController()
        {
            Random random = new Random();
            testShawaShops.AddRange(Enumerable.Range(0, 20).Select(
                i => new _ShawaShop($"Шавашоп {i}", new GeoCoordinate(30.41 + (random.NextDouble() - 0.5) / 5, 59.90 + (random.NextDouble() - 0.5) / 5))));
        }
        private readonly IRepository<ShawaShop> shawaShopRepository;
        public HomeController(IRepository<ShawaShop> shawaShopRepository)
        {
            this.shawaShopRepository = shawaShopRepository;
        }

        public ActionResult Index()
        {
            var showindShops = testShawaShops.Take(10);
            return View(showindShops);
        }

        public ActionResult ShawaShop(int id = -1)
        {
            if (testShawaShops.Exists(shop => shop.Id == id))
            {
                return View(testShawaShops.First(shop => shop.Id == id));
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