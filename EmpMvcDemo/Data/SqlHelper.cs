﻿using Dapper;
using EmpMvcDemo.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Web;

namespace EmpMvcDemo.Data
{
    public static class SqlHelper
    {
        public static T GetRecord<T>(string spName, List<ParameterInfo> parameters)
        {
            T objRecord = default(T);
            using (SqlConnection objConnection = new SqlConnection(DBConnect.ConnectionString()))
            {
                objConnection.Open();
                DynamicParameters p = new DynamicParameters();
                foreach (var param in parameters)
                {
                    p.Add("@" + param.ParameterName, param.ParameterValue);
                }

                objRecord = SqlMapper.Query<T>(objConnection, spName, p, commandType: CommandType.StoredProcedure).FirstOrDefault();
                objConnection.Close();
            }
            return objRecord;
        }
        public static List<T> GetRecordList<T>(string spName)
        {
            List<T> recordList = new List<T>();
            using (SqlConnection objConnection = new SqlConnection(DBConnect.ConnectionString()))
            {
                objConnection.Open();
                recordList = SqlMapper.Query<T>(objConnection, spName, commandType: CommandType.StoredProcedure).ToList();
                objConnection.Close();
            }
            return recordList;
        }
        public static List<T> GetRecords<T>(string spName, List<ParameterInfo> parameters)
        {
            List<T> recordList = new List<T>();
            using (SqlConnection objConnection = new SqlConnection(DBConnect.ConnectionString()))
            {
                objConnection.Open();
                DynamicParameters p = new DynamicParameters();
                foreach (var param in parameters)
                {
                    p.Add("@" + param.ParameterName, param.ParameterValue);
                }

                recordList = SqlMapper.Query<T>(objConnection, spName, p, commandType: CommandType.StoredProcedure).ToList();
                objConnection.Close();
            }
            return recordList;
        }
        public static int GetIntRecord<T>(string spName, List<ParameterInfo> parameters)
        {
            int intRecord = 0;
            using (SqlConnection objConnection = new SqlConnection(DBConnect.ConnectionString()))
            {
                objConnection.Open();
                DynamicParameters p = new DynamicParameters();
                foreach (var param in parameters)
                {
                    p.Add("@" + param.ParameterName, param.ParameterValue);
                }

                using (var reader = SqlMapper.ExecuteReader(objConnection, spName, p, commandType: CommandType.StoredProcedure))
                {
                    if (reader != null && reader.Read())
                    {
                        intRecord = Convert.ToInt32(reader[0].ToString());
                    }
                }
                objConnection.Close();
            }
            return intRecord;
        }
        public static int ExecuteQuery(string spName, List<ParameterInfo> parameters)
        {
            int success = 0;
            using (SqlConnection objConnection = new SqlConnection(DBConnect.ConnectionString()))
            {
                objConnection.Open();
                DynamicParameters p = new DynamicParameters();
                foreach (var param in parameters)
                {
                    p.Add("@" + param.ParameterName, param.ParameterValue);
                }
                success = SqlMapper.Execute(objConnection, spName, p, commandType: CommandType.StoredProcedure);
                objConnection.Close();
            }
            return success;
        }
    }
}
