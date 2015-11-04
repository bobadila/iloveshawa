using System;
using System.Collections.Generic;
using System.Web.Mvc;
using ILoveShawa.Domain.IRepository;
using System.Device.Location;
using System.Linq;
using System.Web.Script.Serialization;
using System.Web.UI;

namespace ILoveShawa.Controllers
{
    public class HomeController : Controller
    {
        private readonly IShawaShopRepository shawaShopRepository;
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

        private readonly List<_ShawaShop> testShawaShops;

        public HomeController(IShawaShopRepository shawaShopRepository)
        {
            this.shawaShopRepository = shawaShopRepository;
            testShawaShops = new List<_ShawaShop>();
            testShawaShops.AddRange(Enumerable.Range(0, 20).Select(
                i => new _ShawaShop($"Шавашоп {i}", new GeoCoordinate(30.41, 59.90))));
        }

        public ActionResult Index()
        {
            var showindShops = testShawaShops.Take(10);
            return View(showindShops);
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