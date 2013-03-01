using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using TMA.DAO.EntityManager;
using System.Web.Script.Serialization;
using BMS.WEB.cls;
using System.Collections.Generic;
using Newtonsoft.Json;
using BMS.CONFIGURATION;
using System.IO;

namespace BMS.WEB.pages.person
{
    public partial class RegisterPerson : System.Web.UI.Page
    {
        public static JavaScriptSerializer serialize = new JavaScriptSerializer();

        [System.Web.Services.WebMethod]
        public static string Save(string UserProperties)
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                Dictionary<string, string> dicProperties = JsonConvert.DeserializeObject<Dictionary<string, string>>(UserProperties);

                TMA.MODEL.Entity.Person person = new TMA.MODEL.Entity.Person();

                person.Name = dicProperties["Name"];
                person.LastName = dicProperties["LastName"];
                person.IsActive = Convert.ToBoolean(dicProperties["IsActive"]);
                person.Address = dicProperties["Address"];
                person.BirthdayDay = Convert.ToDateTime(dicProperties["Birthday"]).Day;
                person.BirthdayMonth = Convert.ToDateTime(dicProperties["Birthday"]).Month;
                person.TelephoneNumber = Convert.ToInt32(dicProperties["TelephoneNumber"]);
                person.CelphoneNumber = Convert.ToInt64(dicProperties["TelephoneNumber"]);
                person.City = Convert.ToInt32(dicProperties["Id_City"]);
                person.Company = Convert.ToInt32(dicProperties["Id_Third"]);
                person.Email = dicProperties["Email"];
                person.Observations = dicProperties["Observations"];
                person.FaxNumber = Convert.ToInt32(dicProperties["FaxNumber"]);
                person.DateValidityARP = dicProperties["DateValidityARP"];
                person.Contractor = Convert.ToInt32(dicProperties["Contractor"]);
                person.DateCreateRegistration = System.DateTime.Now;
                person.DateModifyRegistration = System.DateTime.Now;

                PersonsDao.save(person);

                msg.Message = ConfigManager.SaveSuccessMessage;
            }
            catch (Exception ex)
            {
                msg.Message = ConfigManager.SaveErrorMessage;

                msg.Error = ex.ToString();

                File.AppendAllText(ConfigManager.LogPath, msg.ToString());
            }

            return serialize.Serialize(msg);
        }

        [System.Web.Services.WebMethod]
        public static string Find(string field, string value)
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                return serialize.Serialize(PersonsDao.findBy(field, value));
            }
            catch (Exception ex)
            {
                msg.Message = ConfigManager.ListErrorMessage;

                msg.Error = ex.ToString();

                File.AppendAllText(ConfigManager.LogPath, msg.ToString());
            }

            return serialize.Serialize(msg);

        }

        [System.Web.Services.WebMethod]
        public static string List(string start, string limit)
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                return serialize.Serialize(PersonsDao.findAll());
            }
            catch (Exception ex)
            {
                msg.Message = ConfigManager.ListErrorMessage;

                msg.Error = ex.ToString();

                File.AppendAllText(ConfigManager.LogPath, msg.ToString());
            }

            return serialize.Serialize(msg);

        }

        [System.Web.Services.WebMethod]
        public static string Delete(string Id_Person)
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                TMA.MODEL.Entity.Person person = PersonsDao.find(Convert.ToInt32(Id_Person));

                PersonsDao.delete(person);

                msg.Message = ConfigManager.DeleteSuccessMessage;
            }
            catch (Exception ex)
            {
                msg.Message = ConfigManager.DeleteErrorMessage;

                msg.Error = ex.ToString();

                File.AppendAllText(ConfigManager.LogPath, msg.ToString());
            }

            return serialize.Serialize(msg);
        }

        [System.Web.Services.WebMethod]
        public static string GetCompany()
        {
            return serialize.Serialize(CompaniesDao.findAll());
        }

        [System.Web.Services.WebMethod]
        public static string GetCity()
        {
            return serialize.Serialize(CitiesDao.findAll());
        }

        [System.Web.Services.WebMethod]
        public static string GetDepartment()
        {
            return serialize.Serialize(DepartmentsDao.findAll());
        }
    }
}
