using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using QuizQpplicationMVC.Models;

namespace QuizQpplicationMVC.Controllers
{
    public class AdminController : Controller
    {
        DBQuizEntities db = new DBQuizEntities();

        // GET: Admin
        [HttpGet]
        public ActionResult Index()
        {
            if (Session["ad_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            List<Quiz> li = db.Quizs.OrderByDescending(x => x.QuizID).ToList();
            ViewData["list"] = li;
            return View();
        }
        [HttpPost]
        public ActionResult Index(string search)
        {
            if (search == null || search == "")
            {
                return RedirectToAction("Index");
            }

            List<Quiz> li = db.Quizs.Where(x => x.QuizName.Contains(search)).OrderByDescending(x => x.QuizID).ToList();
            ViewData["list"] = li;
            return View();
        }

        //tao de thi
        [HttpGet]
        public ActionResult CreateQuizz()
        {
            if (Session["ad_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            return View();
        }
        [HttpPost]
        public ActionResult CreateQuizz(Quiz q)
        {
            Quiz quiz = db.Quizs.Where(x => x.QuizName == q.QuizName).SingleOrDefault();

            if (quiz == null)
            {
                if (ModelState.IsValid)
                {
                    Quiz qu = new Quiz();
                    qu.QuizName = q.QuizName;
                    db.Quizs.Add(qu);
                    db.SaveChanges();

                    ViewBag.msg1 = "This Quizz has been added!";
                }
                else
                {
                    ViewBag.msg = "";
                }
            }
            else
            {
                ViewBag.msg = "This category already exists!";
            }

            return View();
        }


        //xem thu vien cau hoi
        [HttpGet]
        public ActionResult QuestionOfQuizz(int? id)
        {
            if (Session["ad_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }
            if (id == null)
            {
                return RedirectToAction("Index");
            }

            List<Question> li = db.Questions.Where(x => x.QuizID == id).OrderByDescending(x => x.QuestionID).ToList();
            ViewData["list"] = li;

            TempData["quizz_id"] = id;
            TempData["quizz_name"] = db.Quizs.Where(x => x.QuizID == id).SingleOrDefault().QuizName;
            TempData.Keep();
            return View();
        }
        [HttpPost]
        public ActionResult QuestionOfQuizz(string search)
        {
            int quizzid = Convert.ToInt32(TempData["quizz_id"]);

            if (search == null || search == "")
            {
                return RedirectToAction("QuestionOfQuizz");
            }

            List<Question> li = db.Questions.Where(x => x.QuestionText.Contains(search)).OrderByDescending(x => x.QuestionID).ToList();
            ViewData["list"] = li;

            TempData.Keep();
            return View();
        }

        //edit de thi
        [HttpGet]
        public ActionResult EditQuizz(int? id)
        {
            if (Session["ad_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }
            if (id == null)
            {
                return RedirectToAction("Index");
            }

            Quiz q = db.Quizs.Where(x => x.QuizID == id).SingleOrDefault();

            return View(q);
        }
        [HttpPost]
        public ActionResult EditQuizz(Quiz q, int? id)
        {
            if (id == null)
            {
                return RedirectToAction("Index");
            }

            if (q.QuizName == "")
            {
                Quiz qz = db.Quizs.Where(x => x.QuizID == id).SingleOrDefault();
                ViewBag.error = "QuizzName is required!";
                return View(qz);
            }

            Quiz qu = db.Quizs.Where(x => x.QuizName == q.QuizName).SingleOrDefault();

            if (qu != null)
            {
                ViewBag.error = "QuizzName already exists!";
                Quiz qz = db.Quizs.Where(x => x.QuizID == id).SingleOrDefault();
                return View(qz);
            }

            Quiz qi = db.Quizs.Where(x => x.QuizID == id).SingleOrDefault();
            qi.QuizName = q.QuizName;
            db.Quizs.AddOrUpdate(qi);
            db.SaveChanges();

            Quiz qz1 = db.Quizs.Where(x => x.QuizID == id).SingleOrDefault();
            ViewBag.success = "This Quizz had been renamed!";
            return View(qz1);
        }

        //xoa de thi(neu k co cau hoi nao trong thu vien)
        public ActionResult DeleteQuizz(int? id)
        {
            if (Session["ad_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }
            if (id == null)
            {
                return RedirectToAction("Index");
            }

            try
            {
                Quiz cate = db.Quizs.Where(x => x.QuizID == id).SingleOrDefault();
                if (cate.Questions.Count() > 0)
                {
                    return RedirectToAction("Index");
                }

                db.Quizs.Remove(cate);
                db.SaveChanges();
            }
            catch { }

            return RedirectToAction("Index");
        }

        //tao cau hoi
        [HttpGet]
        public ActionResult CreateQuestion()
        {
            if (Session["ad_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            TempData.Keep();
            return View();
        }
        [HttpPost]
        public ActionResult CreateQuestion(string content, QuestionModel q)
        {
            if (content == "" || content == null)
            {
                ViewBag.error = "Question content is required!";
                TempData.Keep();
                return View();
            }
            else
            {
                q.content = content;
            }

            int quizzid = Convert.ToInt32(TempData["quizz_id"]);
            Question qu = db.Questions.Where(x => x.QuizID == quizzid && x.QuestionText == content).SingleOrDefault();

            if (qu != null)
            {
                ViewBag.error = "Question already exists!";
                TempData.Keep();
                return View();
            }
            if (ModelState.IsValid)
            {
                Question qe = new Question();
                qe.QuizID = quizzid;
                qe.QuestionText = q.content;
                db.Questions.Add(qe);
                db.SaveChanges();

                Question ques = db.Questions.Where(x => x.QuestionText == content && x.QuizID == quizzid).SingleOrDefault();

                Choice ch = new Choice();
                ch.QuestionID = ques.QuestionID;
                ch.ChoiceText = q.opA;
                db.Choices.Add(ch);
                db.SaveChanges();
                ch.ChoiceText = q.opB;
                db.Choices.Add(ch);
                db.SaveChanges();
                ch.ChoiceText = q.opC;
                db.Choices.Add(ch);
                db.SaveChanges();
                ch.ChoiceText = q.opD;
                db.Choices.Add(ch);
                db.SaveChanges();

                TempData["ques_id"] = ques.QuestionID;
                TempData["ques_name"] = ques.QuestionText;
                TempData.Keep();
                return RedirectToAction("ChooseAnswer");

            }
            else
            {
                ViewBag.error = "";
                TempData.Keep();
                return View();
            }

        }

        //sau khi tao cau hoi, chon dap an dung cho cau hoi
        [HttpGet]
        public ActionResult ChooseAnswer()
        {
            int quesid = Convert.ToInt32(TempData["ques_id"]);

            if (Session["ad_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            List<Choice> choices = db.Choices.Where(x => x.QuestionID == quesid).ToList();
            List<string> ans = new List<string>();
            foreach (var i in choices)
            {
                ans.Add(i.ChoiceText);
            }
            ViewData["list"] = ans;
            TempData.Keep();
            return View();
        }
        [HttpPost]
        public ActionResult ChooseAnswer(string ans)
        {
            int quesid = Convert.ToInt32(TempData["ques_id"]);

            Answer ae = db.Answers.Where(x => x.QuestionID == quesid).SingleOrDefault();
            if (ae!=null)
            {
                db.Answers.Remove(ae);
                db.SaveChanges();
            }

            Answer aw = new Answer();
            aw.QuestionID = quesid;
            aw.AnswerText = ans;
            db.Answers.Add(aw);
            db.SaveChanges();

            return RedirectToAction("QuestionOfQuizz", new RouteValueDictionary(
                        new { controller = "Admin", action = "QuestionOfQuizz", Id = Convert.ToInt32(TempData["quizz_id"]) }));
        }

        //xoa cau hoi
        public ActionResult DeleteQuestion(int? id)
        {
            if (id != null)
            {
                Answer ans = db.Answers.Where(x => x.QuestionID == id).SingleOrDefault();
                if (ans != null)
                {
                    db.Answers.Remove(ans);
                }

                List<Choice> choices = db.Choices.Where(x => x.QuestionID == id).ToList();
                foreach (var i in choices)
                {
                    db.Choices.Remove(i);
                }

                Question q = db.Questions.Where(x => x.QuestionID == id).SingleOrDefault();
                db.Questions.Remove(q);

                db.SaveChanges();
            }

            return RedirectToAction("QuestionOfQuizz", new RouteValueDictionary(
                        new { controller = "Admin", action = "QuestionOfQuizz", Id = Convert.ToInt32(TempData["quizz_id"]) }));
        }

        //xem chi tiet
        public ActionResult QuestionDetail(int? id)
        {
            if (Session["ad_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            if (id == null)
            {
                return RedirectToAction("QuestionOfQuizz", new RouteValueDictionary(
                        new { controller = "Admin", action = "QuestionOfQuizz", Id = Convert.ToInt32(TempData["quizz_id"]) }));
            }

            Question q = db.Questions.Where(x => x.QuestionID == id).SingleOrDefault();
            List<Choice> choices = db.Choices.Where(x => x.QuestionID == id).ToList();
            List<string> li = new List<string>();
            foreach(var i in choices)
            {
                li.Add(i.ChoiceText);
            }
            ViewData["list"] = li;
            Answer ans = db.Answers.Where(x => x.QuestionID == id).SingleOrDefault();
            ViewBag.ans = ans.AnswerText;

            TempData.Keep();
            return View(q);
        }

        //sua cau hoi
        [HttpGet]
        public ActionResult EditQuestion(int? id)
        {
            if (Session["ad_id"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            if (id == null)
            {
                return RedirectToAction("QuestionOfQuizz", new RouteValueDictionary(
                        new { controller = "Admin", action = "QuestionOfQuizz", Id = Convert.ToInt32(TempData["quizz_id"]) }));
            }

            QuestionModel qm = new QuestionModel();

            Question q = db.Questions.Where(x => x.QuestionID == id).SingleOrDefault();
            List<Choice> choices = db.Choices.Where(x => x.QuestionID == id).ToList();
            List<string> li = new List<string>();

            qm.content = q.QuestionText;
            qm.opA = choices[0].ChoiceText;
            qm.opB = choices[1].ChoiceText;
            qm.opC = choices[2].ChoiceText;
            qm.opD = choices[3].ChoiceText;

            //Answer ans = db.Answers.Where(x => x.QuestionID == id).SingleOrDefault();

            TempData["ques_id"] = id;
            Answer ans = db.Answers.Where(x => x.QuestionID == id).SingleOrDefault();
            ViewBag.ans = ans.AnswerText;

            TempData.Keep();
            return View(qm);
        }
        [HttpPost]
        public ActionResult EditQuestion(QuestionModel q, int? id, string content)
        {
            if (content == "" || content == null)
            {
                ViewBag.error = "Question content is required!";
                TempData.Keep();
                return View();
            }
            else
            {
                q.content = content;
            }

            int quizzid = Convert.ToInt32(TempData["quizz_id"]);
            Question qu = db.Questions.Where(x => x.QuizID == quizzid && x.QuestionText == content && x.QuestionID!=id).SingleOrDefault();

            if (qu != null)
            {
                ViewBag.error = "Question already exists!";
                TempData.Keep();
                return RedirectToAction("EditQuestion", new RouteValueDictionary(
                        new { controller = "Admin", action = "EditQuestion", Id = id }));
            }
            if (ModelState.IsValid)
            {
                Question qe = db.Questions.Where(x=>x.QuestionID==id).SingleOrDefault();
                qe.QuestionText = q.content;
                db.Questions.AddOrUpdate(qe);
                db.SaveChanges();

                List<Choice> ch = db.Choices.Where(x=>x.QuestionID==id).ToList();
                ch[0].ChoiceText = q.opA;
                ch[1].ChoiceText = q.opB;
                ch[2].ChoiceText = q.opC;
                ch[3].ChoiceText = q.opD;
                foreach(var i in ch)
                {
                    db.Choices.AddOrUpdate(i);
                    db.SaveChanges();
                }

                Question ques = db.Questions.Where(x => x.QuestionID==id).SingleOrDefault();

                TempData["ques_id"] = ques.QuestionID;
                TempData["ques_name"] = ques.QuestionText;
                TempData.Keep();
                return RedirectToAction("ChooseAnswer");

            }
            else
            {
                ViewBag.error = "";
                TempData.Keep();
                return RedirectToAction("EditQuestion", new RouteValueDictionary(
                        new { controller = "Admin", action = "EditQuestion", Id = id }));
            }
        }
    }
}