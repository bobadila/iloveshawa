using System.Web.Mvc;
using ILoveShawa.Domain;
using ILoveShawa.Domain.IRepository;

namespace ILoveShawa.Controllers
{
    public class HomeController : Controller
    {
        private readonly IRepository<ShawaShop> shawaShopRepository;
        public HomeController(IRepository<ShawaShop> shawaShopRepository)
        {
            this.shawaShopRepository = shawaShopRepository;
        }

        public ActionResult Index()
        {
            return View(shawaShopRepository.GetAll());
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