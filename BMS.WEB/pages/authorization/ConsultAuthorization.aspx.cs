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

namespace BMS.WEB.pages.authorization
{
    public partial class ConsultAuthorization : System.Web.UI.Page
    {
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
                        case "List":
                            Response.Write("({success: true, data:" + this.List("","") + "})");
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

        public string Find(string objProperties)
        {
            MessageResponse msg = new MessageResponse();

            Dictionary<string, string> dicProperties = JsonConvert.DeserializeObject<Dictionary<string, string>>(objProperties);

            try
            {
                int numberParam;

                if (int.TryParse(dicProperties["value"], out numberParam))
                {
                    return serialize.Serialize(VisitsDao.findBy(dicProperties["field"], numberParam));
                }
                else 
                {
                    if (dicProperties["field"].Contains("Person"))
                    {
                        if (dicProperties["field"].Contains("Company"))
                        {
                            return serialize.Serialize(VisitsDao.findCompanyBy(dicProperties["field"].Split('.')[2], dicProperties["value"]));
                        }
                        else
                        {
                            return serialize.Serialize(VisitsDao.findPersonBy(dicProperties["field"].Split('.')[1], dicProperties["value"]));
                        }
                    }
                    if (dicProperties["field"].Contains("Functionary"))
                    {

                        if (dicProperties["field"].Contains("Name"))
                        {
                            return serialize.Serialize(VisitsDao.findFunctionaryBy(dicProperties["field"].Split('.')[2], dicProperties["value"]));
                        }
                    }
                    else
                    {
                        DateTime InitialDate;
                        if (DateTime.TryParse(dicProperties["value"], out InitialDate))
                        {
                            return serialize.Serialize(VisitsDao.findBy(dicProperties["field"], InitialDate));
                        }
                        else 
                        {
                            return serialize.Serialize(VisitsDao.findBy(dicProperties["field"], dicProperties["value"]));
                        }
                    }
                }
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
                DateTime today = System.DateTime.Today;

                return serialize.Serialize(VisitsDao.findByInitialDate(today));
            }
            catch (Exception ex)
            {
                msg.Message = ConfigManager.ListErrorMessage;

                msg.Error = ex.ToString();

                File.AppendAllText(ConfigManager.LogPath, msg.ToString());
            }

            System.Threading.Thread.Sleep(int.Parse(ConfigManager.TimeForResponseRequest));

            return serialize.Serialize(msg);
        }
    }
}
