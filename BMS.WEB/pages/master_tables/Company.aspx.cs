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
using BMS.UTILITY;
using System.Collections.Generic;
using Newtonsoft.Json;

namespace BMS.WEB.pages
{
    public partial class Company : System.Web.UI.Page
    {
        public Utility util = new Utility();

        public JavaScriptSerializer serialize = new JavaScriptSerializer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string action = Request.Params["accion"];
                if (!string.IsNullOrEmpty(action))
                {
                    switch (action)
                    {
                        case "Save":
                            Response.Write("({success: true, data:" + this.Save(Request.Params["objProperties"]) + "})");
                            break;
                        case "List":
                            Response.Write("({success: true, data:" + this.List("", "") + "})");
                            break;
                        case "Delete":
                            Response.Write("({success: true, data:" + this.Delete(Request.Params["objProperties"]) + "})");
                            break;
                        case "GetCity":
                            Response.Write("({success: true, data:" + this.GetCity() + "})");
                            break;
                        default:
                            return;
                    }

                    Response.End();
                }
            }
        }

        public string GetCity()
        {
            System.Threading.Thread.Sleep(int.Parse(ConfigManager.TimeForResponseRequest));

            return serialize.Serialize(CitiesDao.findAll());
        }

        public string Save(string objProperties)
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                Dictionary<string, string> dicProperties = JsonConvert.DeserializeObject<Dictionary<string, string>>(objProperties);

                TMA.MODEL.Entity.Company company = CompaniesDao.find(string.IsNullOrEmpty(util.getValueFromDictionary("Id_Third", dicProperties)) ? -1 : int.Parse(util.getValueFromDictionary("Id_Third", dicProperties)));

                if (company == null)
                {

                    company = new TMA.MODEL.Entity.Company()
                    {
                        Name = util.getValueFromDictionary("Name", dicProperties),
                        Id_Subsidiary = string.IsNullOrEmpty(util.getValueFromDictionary("Id_Subsidiary", dicProperties)) ? -1 : int.Parse(util.getValueFromDictionary("Id_Subsidiary", dicProperties)),
                        AirSection = util.getValueFromDictionary("AirSection", dicProperties),
                        DateCreateRegistration = DateTime.Now

                    };

                    CompaniesDao.save(company);
                }

                else
                {
                    company.DateModifyRegistration = DateTime.Now;

                    CompaniesDao.update(company);
                }

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

        public string List(string start, string limit)
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                return serialize.Serialize(CompaniesDao.findAll());
            }
            catch (Exception ex)
            {
                msg.Message = ConfigManager.DeleteErrorMessage;

                msg.Error = ex.ToString();

                File.AppendAllText(ConfigManager.LogPath, msg.ToString());
            }

            return serialize.Serialize(msg);
        }

        public string Delete(string Id_Company)
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                TMA.MODEL.Entity.Company company = CompaniesDao.find(!string.IsNullOrEmpty(Id_Company) ? int.Parse(Id_Company) : -1 );

                CompaniesDao.delete(company);

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

    }
}
