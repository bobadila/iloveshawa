using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Security.Cryptography;
using System.Threading.Tasks;
using System.Web.Mvc;
using ILoveShawa.Domain.IRepository;
using ILoveShawa.Domain;
using ILoveShawa.Models;
using System.Web.Security;

namespace ILoveShawa.Controllers
{
    [Authorize]
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Index()
        {
            return View();
        }

        private readonly IRepository<User> userRepository;

        private string CalculateMD5Hash(string input)
        {
            MD5 md5 = MD5.Create();
            byte[] inputBytes = Encoding.ASCII.GetBytes(input);
            byte[] hash = md5.ComputeHash(inputBytes);

            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hash.Length; i++)
            {
                sb.Append(hash[i].ToString("X2"));
            }
            return sb.ToString();
        }

        public UserController(IRepository<User> userRepository)
        {
            this.userRepository = userRepository;
        }


        [AllowAnonymous]
        public ActionResult Register()
        {
            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = new User();
                user.Email = model.Email;
                user.Password = CalculateMD5Hash(model.Password);
                user.Name = model.Email;

                userRepository.Add(user);

                return RedirectToAction("Login", "User");
            }
            ModelState.AddModelError("", "Incorrect user name or password.");
            return View(model);
        }

        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult Login(LoginViewModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                var user = new User();
                user.Email = model.Email;
                user.Password = CalculateMD5Hash(model.Password);
                var dbUser = userRepository.Get(x => x.Email == model.Email).First();

                if (dbUser != null && dbUser.Password == user.Password)
                {
                    FormsAuthentication.SetAuthCookie(model.Email, model.RememberMe);
                    // TODO: redirect to User View
                    return RedirectToAction("Index", "Home");
                }
            }
            ModelState.AddModelError("", "Incorrect user name or password.");
            return View(model);
        }

        [HttpPost]
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home");
        }
    }
}