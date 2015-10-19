using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ILoveShawa.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            using (var gg = new Domain.ILoveShawaContainer())
            {
                return View(gg.shawashops);
            }
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