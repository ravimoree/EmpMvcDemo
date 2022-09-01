using EmpMvcDemo.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;

namespace EmpMvcDemo.Controllers
{
    public class EmployeeController : Controller
    {

        IEmployee dc = new EmployeeServics();

        public ActionResult Index(int? page, string Sorting_Order)
        {
            ViewBag.SortingName = String.IsNullOrEmpty(Sorting_Order) ? "Gender" : "";
            var list = dc.GetEmployees();
            switch (Sorting_Order)
            {
                case "Gender":
                    list = list.OrderByDescending(x=> x.Gender).ToList();
                    break;
                default:
                    list = list.OrderBy(x=> x.EmployeeCode).ToList();
                    break;
            }
            return View(list.ToPagedList(page ?? 1, 5));
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Employee obj, HttpPostedFileBase Photo)
        {

            if (Photo != null)
            {
                string path = Path.Combine(Server.MapPath("~/Image"), Path.GetFileName(Photo.FileName));
                Photo.SaveAs(path);
                obj.Photo = Convert.ToString("Image/" + Photo.FileName);

            }

            dc.AddEmployee(obj);
            return RedirectToAction("Index");
        }
        
        public ActionResult Edit(int id)
        {
            var objt = dc.GetEmployees().Find(m => m.EId == id);
            return View(objt);
        }
        [HttpPost]
        public ActionResult Edit(Employee obj, HttpPostedFileBase Photo)
        {
            if (Photo != null)
            {
                string path = Path.Combine(Server.MapPath("~/Image"), Path.GetFileName(Photo.FileName));
                Photo.SaveAs(path);
                obj.Photo = Convert.ToString("Image/" + Photo.FileName);

            }
            dc.UpdateEmployee(obj);
            return RedirectToAction("Index");
        }
        public ActionResult Delete(int id)
        {
            dc.DeleteEmployee(id);
            return RedirectToAction("Index");
        }
    }
};