using EmpMvcDemo.Data;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace EmpMvcDemo.Models
{
    public class EmployeeServics : IEmployee
    {
        public void AddEmployee(Employee obj)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(new ParameterInfo() { ParameterName = "EmployeeCode", ParameterValue = obj.EmployeeCode });
            parameters.Add(new ParameterInfo() { ParameterName = "FirstName", ParameterValue = obj.FirstName });
            parameters.Add(new ParameterInfo() { ParameterName = "MiddleName", ParameterValue = obj.MiddleName });
            parameters.Add(new ParameterInfo() { ParameterName = "LastName", ParameterValue = obj.LastName });
            parameters.Add(new ParameterInfo() { ParameterName = "DOB", ParameterValue = obj.DOB });
            parameters.Add(new ParameterInfo() { ParameterName = "Age", ParameterValue = obj.Age });
            parameters.Add(new ParameterInfo() { ParameterName = "ContactNo", ParameterValue = obj.ContactNo });
            parameters.Add(new ParameterInfo() { ParameterName = "Gender", ParameterValue = obj.Gender });
            parameters.Add(new ParameterInfo() { ParameterName = "Email", ParameterValue = obj.Email });
            parameters.Add(new ParameterInfo() { ParameterName = "Photo", ParameterValue = obj.Photo });

            SqlHelper.GetIntRecord<Employee>("Sp_InsertEmployee", parameters);
        }

        public int DeleteEmployee(int id)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(new ParameterInfo() { ParameterName = "Eid", ParameterValue = id });
            int success = SqlHelper.ExecuteQuery("Sp_DeleteEmployee", parameters);
            return success;
        }


        public List<Employee> GetEmployees()
        {
            var elist = SqlHelper.GetRecordList<Employee>("Sp_GetAllEmployee").ToList();
            return elist;
        }
        public List<Employee> GetEmployeesList(JQueryDataTableParamModel Jparam, string sortColumn)
        {
            List<SQLParam> Param = new List<SQLParam>();
            Param.Add(new SQLParam("@iDisplayStart", Jparam.iDisplayStart));
            Param.Add(new SQLParam("@iDisplayLength", Jparam.iDisplayLength));
            Param.Add(new SQLParam("@SortColumn", sortColumn));
            Param.Add(new SQLParam("@SortDir", Jparam.sSortDir_0));
            Param.Add(new SQLParam("@Search", Jparam.sSearch ?? ""));
            Param.Add(new SQLParam("@SearchRecords", ParameterDirection.Output));


            var elist = SqlHelper.GetRecordList<Employee>("Sp_GetAllEmployee").ToList();
            return elist;
        }

        public void UpdateEmployee(Employee obj)
        {
            List<ParameterInfo> parameters = new List<ParameterInfo>();
            parameters.Add(new ParameterInfo() { ParameterName = "EId", ParameterValue = obj.EId });
            parameters.Add(new ParameterInfo() { ParameterName = "EmployeeCode", ParameterValue = obj.EmployeeCode });
            parameters.Add(new ParameterInfo() { ParameterName = "FirstName", ParameterValue = obj.FirstName });
            parameters.Add(new ParameterInfo() { ParameterName = "MiddleName", ParameterValue = obj.MiddleName });
            parameters.Add(new ParameterInfo() { ParameterName = "LastName", ParameterValue = obj.LastName });
            parameters.Add(new ParameterInfo() { ParameterName = "DOB", ParameterValue = obj.DOB });
            parameters.Add(new ParameterInfo() { ParameterName = "Age", ParameterValue = obj.Age });
            parameters.Add(new ParameterInfo() { ParameterName = "ContactNo", ParameterValue = obj.ContactNo });
            parameters.Add(new ParameterInfo() { ParameterName = "Gender", ParameterValue = obj.Gender });
            parameters.Add(new ParameterInfo() { ParameterName = "Email", ParameterValue = obj.Email });
            parameters.Add(new ParameterInfo() { ParameterName = "Photo", ParameterValue = obj.Photo });

            SqlHelper.GetIntRecord<Employee>("Sp_UpdateEmployee", parameters);
        }
    }
}