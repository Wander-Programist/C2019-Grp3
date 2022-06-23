using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Web_Poultry.Models;

namespace Web_Poultry.Controllers
{
    public class ChickensController : Controller
    {
        private ApplicationgDbContext db = new ApplicationgDbContext();

        // GET: Chickens
        public ActionResult Index()
        {
            return View(db.Chickens.ToList());
        }

        // GET: Chickens/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Chicken chicken = db.Chickens.Find(id);
            if (chicken == null)
            {
                return HttpNotFound();
            }
            return View(chicken);
        }

        // GET: Chickens/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Chickens/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,ChickenType,ChickenBirthWeight,ChickenBirthday,ProductType")] Chicken chicken)
        {
            if (ModelState.IsValid)
            {
                db.Chickens.Add(chicken);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(chicken);
        }

        // GET: Chickens/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Chicken chicken = db.Chickens.Find(id);
            if (chicken == null)
            {
                return HttpNotFound();
            }
            return View(chicken);
        }

        // POST: Chickens/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,ChickenType,ChickenBirthWeight,ChickenBirthday,ProductType")] Chicken chicken)
        {
            if (ModelState.IsValid)
            {
                db.Entry(chicken).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(chicken);
        }

        // GET: Chickens/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Chicken chicken = db.Chickens.Find(id);
            if (chicken == null)
            {
                return HttpNotFound();
            }
            return View(chicken);
        }

        // POST: Chickens/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Chicken chicken = db.Chickens.Find(id);
            db.Chickens.Remove(chicken);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
