using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmpMvcDemo.Models
{
   public interface IEmployee
    {
        List<Employee> GetEmployeesList(JQueryDataTableParamModel Jparam, string sortColumn);
        void AddEmployee(Employee obj);
        List<Employee> GetEmployees();
        void UpdateEmployee(Employee obj);
        int DeleteEmployee(int id);

    }
}
