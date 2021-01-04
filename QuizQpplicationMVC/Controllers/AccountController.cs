using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuizQpplicationMVC.Models;
using QuizQpplicationMVC.viewModels;

namespace QuizQpplicationMVC.Controllers
{
    public class AccountController : Controller
    {
        DBQuizEntities db = new DBQuizEntities();

        // GET: Account
        public ActionResult Index()
        {
            return View();
        }

        //logout
        public ActionResult Logout()
        {
            Session.Abandon();
            Session.RemoveAll();
            return RedirectToAction("GetUser", "Quizz");
        }

        [HttpGet]
        public ActionResult Login()
        {
            if (Session["ad_id"] != null)
            {
                return RedirectToAction("Index", "Admin");
            }

            return View();
        }
        [HttpPost]
        public ActionResult Login(Admin a)
        {
            try
            {
                string pwd = Cyptop.Encrypt(a.Password, true).ToString();

                Admin acc = db.Admins.Where(x => x.Username == a.Username && x.Password == pwd).SingleOrDefault();

                if (acc != null)
                {
                    Session["ad_id"] = acc.AdminID;
                    return RedirectToAction("Index", "Admin");
                }
                else
                {
                    ViewBag.msg = "Invalid username or password";
                }
            }
            catch { }
            return View();
        }

        //AdminRegister
        [HttpGet]
        public ActionResult AdminRegister()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AdminRegister(AdminRegister r)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Admin a = db.Admins.Where(x => x.Username == r.Username).SingleOrDefault();
                    if (a == null)
                    {
                        Admin acc = new Admin();

                        acc.FullName = r.FullName;
                        acc.Username = r.Username;
                        acc.Password = Cyptop.Encrypt(r.Password, true);
                        acc.ProfilImage = "auto.gif";

                        db.Admins.Add(acc);
                        db.SaveChanges();

                        ViewBag.msg1 = " You can login and create some fun quizz!";
                    }
                    else
                    {
                        ViewBag.msg2 = " Username already exists!";
                    }
                }
                else
                {
                    ViewBag.msg0 = "";
                }
            }
            catch { }
            return View();
        }

        //UserRegister
        [HttpGet]
        public ActionResult UserRegister()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UserRegister(UserRegister r, HttpPostedFileBase img)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    User a = db.Users.Where(x => x.FullName == r.FullName).SingleOrDefault();
                    if (a == null)
                    {
                        User acc = new User();
                        acc.FullName = r.FullName;
                        acc.ProfilImage = "auto1.gif";

                        try
                        {
                            if (img != null && System.IO.Path.GetFileName(img.FileName) != "")
                            {
                                string extension = System.IO.Path.GetExtension(img.FileName);
                                if (extension == ".jpg" || extension == ".png" || extension == ".gif")
                                {
                                    string filename = System.IO.Path.GetFileName(img.FileName);
                                    string urlImage = Server.MapPath("~/Content/images/" + filename);
                                    img.SaveAs(urlImage);
                                    acc.ProfilImage = filename;
                                }
                            }
                        }
                        catch { }

                        db.Users.Add(acc);
                        db.SaveChanges();

                        ViewBag.msg1 = " You can join, have fun!";
                    }
                    else
                    {
                        ViewBag.msg2 = " This name already exists!";
                    }
                }
                else
                {
                    ViewBag.msg0 = "";
                }
            }
            catch { }
            return View();
        }

        //doi avatar
        [HttpGet]
        public ActionResult ChangeAvatar()
        {
            if(Session["UserConnected"] == null)
            {
                return RedirectToAction("GetUser", "Quizz");
            }

            UserVM userconnected = Session["UserConnected"] as UserVM;

            User user = db.Users.Where(x => x.UserID == userconnected.UserID).SingleOrDefault();
            return View(user);
        }
        [HttpPost]
        public ActionResult ChangeAvatar(HttpPostedFileBase img)
        {
            UserVM userconnected = Session["UserConnected"] as UserVM;
            User user = db.Users.Where(x => x.UserID == userconnected.UserID).SingleOrDefault();

            try
            {
                if (img != null && System.IO.Path.GetFileName(img.FileName) != "")
                {
                    string extension = System.IO.Path.GetExtension(img.FileName);
                    if (extension == ".jpg" || extension == ".png" || extension == ".gif")
                    {
                        string filename = System.IO.Path.GetFileName(img.FileName);
                        string urlImage = Server.MapPath("~/Content/images/" + filename);
                        img.SaveAs(urlImage);
                        user.ProfilImage = filename;
                        db.Users.AddOrUpdate(user);
                        db.SaveChanges();
                    }
                }

            }
            catch { }

            //cap nhat lai Session
            UserVM userConnected = db.Users.Where(u => u.FullName == user.FullName)
                                         .Select(u => new UserVM
                                         {
                                             UserID = u.UserID,
                                             FullName = u.FullName,
                                             ProfilImage = u.ProfilImage,

                                         }).FirstOrDefault();

            Session["UserConnected"] = userConnected;
            return RedirectToAction("ChangeAvatar");
        }
    }
}