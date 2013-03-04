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
using BMS.UTILITY;

namespace BMS.WEB.pages.person
{
    public partial class RegisterPerson : System.Web.UI.Page
    {
        public Utility util = new Utility();

        public JavaScriptSerializer serialize = new JavaScriptSerializer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string accion = Request.Params["accion"];
                if (!string.IsNullOrEmpty(accion))
                {
                    switch (accion)
                    {
                        case "List":
                            Response.Write("({success: true, data:" + this.List("", "") + "})");
                            break;
                        case "Find":
                            Response.Write("({success: true, data:" + this.Find(Request.Params["objProperties"]) + "})");
                            break;
                        case "Save":
                            Response.Write("({success: true, data:" + this.Save(Request.Params["objProperties"]) + "})");
                            break;
                        case "Delete":
                            Response.Write("({success: true, data:" + this.Delete(Request.Params["objProperties"]) + "})");
                            break;
                        case "GetCompany":
                            Response.Write("({success: true, data:" + this.GetCompany() + "})");
                            break;
                        case "GetCity":
                            Response.Write("({success: true, data:" + this.GetCity() + "})");
                            break;
                        case "GetDepartment":
                            Response.Write("({success: true, data:" + this.GetDepartment() + "})");
                            break;
                        case "Find":
                            Response.Write("({success: true, data:" + this.Find(Request.Params["objProperties"]) + "})");
                            break;
                        default:
                            return;
                    }

                    Response.End();
                }
            }
        }

<<<<<<< HEAD
        private string Find(string UserProperties)
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                Dictionary<string, string> dicProperties = JsonConvert.DeserializeObject<Dictionary<string, string>>(UserProperties);

                //return serialize.Serialize(PersonsDao.find(Convert.ToInt32(util.getValueFromDictionary("Id_Person", dicProperties))));

                return serialize.Serialize(string.Empty);
            }
            catch (Exception ex)
            {
                msg.Message = ConfigManager.ListErrorMessage;

                msg.Error = ex.ToString();

                File.AppendAllText(ConfigManager.LogPath, msg.ToString());
            }

            return serialize.Serialize(msg);
        }

        public string Save(string UserProperties)
=======
        public string Save(string objProperties)
>>>>>>> 7c76c1368f9ea512b8bf2f6e94dfea7f0fe290f9
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                Dictionary<string, string> dicProperties = JsonConvert.DeserializeObject<Dictionary<string, string>>(objProperties);

                TMA.MODEL.Entity.Person person = new TMA.MODEL.Entity.Person();

<<<<<<< HEAD
                person.Name = util.getValueFromDictionary("Name", dicProperties);
                person.LastName = util.getValueFromDictionary("LastName", dicProperties);
                person.IsActive = Convert.ToBoolean(util.getValueFromDictionary("IsActive", dicProperties));
                person.Address = util.getValueFromDictionary("Address", dicProperties);
                person.BirthdayDay = Convert.ToDateTime(util.getValueFromDictionary("Birthday", dicProperties)).Day;
                person.BirthdayMonth = Convert.ToDateTime(util.getValueFromDictionary("Birthday", dicProperties)).Month;
                person.TelephoneNumber = Convert.ToInt32(util.getValueFromDictionary("TelephoneNumber", dicProperties));
                person.CelphoneNumber = Convert.ToInt64(util.getValueFromDictionary("TelephoneNumber", dicProperties));
                person.City = Convert.ToInt32(util.getValueFromDictionary("Id_City", dicProperties));
                person.Company = Convert.ToInt32(util.getValueFromDictionary("Id_Third", dicProperties));
                person.Email = util.getValueFromDictionary("Email", dicProperties);
                person.Observations = util.getValueFromDictionary("Observations", dicProperties);
                person.FaxNumber = Convert.ToInt32(util.getValueFromDictionary("FaxNumber", dicProperties));
                person.DateValidityARP = util.getValueFromDictionary("DateValidityARP", dicProperties);
                person.Contractor = Convert.ToInt32(util.getValueFromDictionary("Contractor",dicProperties));
=======
                person.Name = dicProperties["Name"];
                person.LastName = dicProperties["LastName"];
                person.IsActive = Convert.ToBoolean(dicProperties["IsActive"]);
                person.Address = dicProperties["Address"];
                person.BirthdayDay = Convert.ToInt32(dicProperties["BirthdayDay"]);
                person.BirthdayMonth = Convert.ToInt32(dicProperties["BirthdayMonth"]);
                person.TelephoneNumber = Convert.ToInt32(dicProperties["TelephoneNumber"]);
                person.CelphoneNumber = Convert.ToInt64(dicProperties["TelephoneNumber"]);
                person.City = Convert.ToInt32(dicProperties["Id_City"]);
                person.Company = Convert.ToInt32(dicProperties["Id_Third"]);
                person.Email = dicProperties["Email"];
                person.Observations = dicProperties["Observations"];
                person.FaxNumber = Convert.ToInt32(dicProperties["FaxNumber"]);
                person.DateValidityARP = dicProperties["DateValidityARP"];
                person.Contractor = Convert.ToInt32(dicProperties["Contractor"]);
>>>>>>> 7c76c1368f9ea512b8bf2f6e94dfea7f0fe290f9
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

        public string Find(string objProperties)
        {
            MessageResponse msg = new MessageResponse();

            Dictionary<string, string> dicProperties = JsonConvert.DeserializeObject<Dictionary<string, string>>(objProperties);

            try
            {
                return serialize.Serialize(PersonsDao.findBy(dicProperties["field"], dicProperties["value"]));
            }
            catch (Exception ex)
            {
                msg.Message = ConfigManager.ListErrorMessage;

                msg.Error = ex.ToString();

                File.AppendAllText(ConfigManager.LogPath, msg.ToString());
            }

            return serialize.Serialize(msg);

        }

        public string List(string start, string limit)
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

        public string Delete(string Id_Person)
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

        public string GetCompany()
        {
            return serialize.Serialize(CompaniesDao.findAll());
        }

        public string GetCity()
        {
            return serialize.Serialize(CitiesDao.findAll());
        }

        public string GetDepartment()
        {
            return serialize.Serialize(DepartmentsDao.findAll());
        }
    }
}
