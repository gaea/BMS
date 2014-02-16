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
using System.Web.Script.Serialization;
using TMA.MODEL.Entity;
using TMA.DAO.EntityManager;
using System.IO;
using BMS.CONFIGURATION;
using BMS.WEB.cls;
using System.Collections.Generic;
using Newtonsoft.Json;
using BMS.UTILITY;

namespace BMS.WEB.pages.authorization
{
    public partial class RegisterRequest : System.Web.UI.Page
    {
        public JavaScriptSerializer serialize = new JavaScriptSerializer();
        public Utility utility = new Utility();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string accion = Request.Params["accion"];
                if (!string.IsNullOrEmpty(accion))
                {
                    int start = Convert.ToInt32(Request.Params["start"]);
                    int limit = Convert.ToInt32(Request.Params["limit"]);
                    string field = Request.Params["field"];
                    string value = Request.Params["value"];
                    string callback = Request.Params["callback"];
                    int Id_Authorization = 0;

                    switch (accion)
                    {
                        case "Rejected":
                            Id_Authorization = Convert.ToInt32(Request.Params["Id_Authorization"]);
                            Response.Write(this.Rejected(Id_Authorization));
                            break;
                        case "List":
                            Response.Write(string.Concat(callback, this.List(start, limit, field, value)));
                            break;
                        case "Acept":
                            Id_Authorization = Convert.ToInt32(Request.Params["Id_Authorization"]);
                            Response.Write(this.Acept(Id_Authorization));
                            break;
                        case "Save":
                            Response.Write("({success: true, data:" + this.Save(Request.Params["objProperties"]) + "})");
                            break;
                        case "Find":
                            Response.Write(string.Concat(callback, this.Find(start, limit, field, value)));
                            break;
                        default:
                            return;
                    }

                    Response.End();
                }
            }
        }

        public string Save(string objProperties)
        {
            MessageResponse msg = new MessageResponse();
            try
            {
                Dictionary<string, string> dicProperties = JsonConvert.DeserializeObject<Dictionary<string, string>>(objProperties);

                TMA.MODEL.Entity.Authorization authorization = AuthorizationsDao.find(Convert.ToInt32(dicProperties["Id_Authorization"]));

                authorization.Id_PersonEntry = utility.getValueFromDictionary("Id_PersonEntry", dicProperties);
                authorization.Id_PersonAuthorizing = Convert.ToInt32(utility.getValueFromDictionary("Id_Functionary", dicProperties));

                authorization.DocumentNumberEntryPerson = utility.getValueFromDictionary("DocumentNumberEntryPerson",dicProperties);
                authorization.NameEntryPerson = utility.getValueFromDictionary("NameEntryPerson",dicProperties);
                authorization.CompanyEntryPerson = utility.getValueFromDictionary("CompanyEntryPerson", dicProperties);
                authorization.CostCenterEntryPerson = utility.getValueFromDictionary("CostCenterEntryPerson",dicProperties);
                authorization.HeadquarterEntryPerson = utility.getValueFromDictionary("HeadquarterEntryPerson", dicProperties);
                authorization.ChargeEntryPerson = utility.getValueFromDictionary("ChargeEntryPerson", dicProperties);

                authorization.StartDate = Convert.ToDateTime(utility.getValueFromDictionary("StartDate", dicProperties) + " " + utility.getValueFromDictionary("StartHour", dicProperties));
                authorization.EndDate = Convert.ToDateTime(utility.getValueFromDictionary("EndDate", dicProperties) + " " + utility.getValueFromDictionary("EndHour", dicProperties));
                authorization.Reason = utility.getValueFromDictionary("Reason", dicProperties);

                AuthorizationsDao.update(authorization);

                msg.Message = ConfigManager.SaveSuccessMessage;
            }
            catch (Exception exception)
            {
                msg.Message = ConfigManager.SaveErrorMessage;
                msg.Error = exception.ToString();
            }

            return serialize.Serialize(msg);
        }

        public string Find(int start, int limit, string field, string value)
        {
            MessageResponse msg = new MessageResponse();
            DataResponse<TMA.MODEL.Entity.Person> dataResponse = new DataResponse<TMA.MODEL.Entity.Person>();

            try
            {
                dataResponse.Result = PersonsDao.findBy(start, limit, field, value);
                dataResponse.Total = PersonsDao.Count(field, value);

                return dataResponse.ToJsonString();
            }
            catch (Exception ex)
            {
                msg.Message = ConfigManager.ListErrorMessage;
                msg.Error = ex.ToString();
            }

            return serialize.Serialize(msg);
        }

        public string List(int start, int limit, string field, string value)
        {
            MessageResponse msg = new MessageResponse();

            DataResponse<TMA.MODEL.Entity.Authorization> dataResponse = new DataResponse<TMA.MODEL.Entity.Authorization>();

            try
            {
                dataResponse.Result = AuthorizationsDao.findAll(start, limit, field, value);
                dataResponse.Total = AuthorizationsDao.Count(field, value);

                return dataResponse.ToJsonString();
            }
            catch (Exception ex)
            {
                msg.Message = ConfigManager.ListErrorMessage;
                msg.Error = ex.ToString();
            }

            return serialize.Serialize(msg);
        }

        public string Acept(int Id_Authorization)
        {
            ActionResponse msg = new ActionResponse();

            try
            {
                TMA.MODEL.Entity.Authorization authorization = AuthorizationsDao.find(Id_Authorization);
                authorization.Authorized = true;
                AuthorizationsDao.update(authorization);
                msg.Success = true;

                msg.Data.Message = ConfigManager.SaveSuccessMessage;
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Data.Message = ConfigManager.SaveErrorMessage;
                msg.Data.Error = ex.ToString();
            }

            return serialize.Serialize(msg);
        }

        public string Rejected(int Id_Authorization)
        {
            ActionResponse msg = new ActionResponse();

            try
            {
                TMA.MODEL.Entity.Authorization authorization = AuthorizationsDao.find(Id_Authorization);
                authorization.Authorized = false;
                AuthorizationsDao.update(authorization);
                msg.Success = true;

                msg.Data.Message = ConfigManager.SaveSuccessMessage;
            }
            catch (Exception ex)
            {
                msg.Success = false;
                msg.Data.Message = ConfigManager.SaveErrorMessage;
                msg.Data.Error = ex.ToString();
            }

            return serialize.Serialize(msg);
        }
    }
}
