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
            return View(shawaShopRepository.GetShawaShops());
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