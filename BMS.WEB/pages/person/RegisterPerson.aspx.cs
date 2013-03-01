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
