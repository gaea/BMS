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
                return serialize.Serialize(VisitsDao.findBy(dicProperties["field"], dicProperties["value"]));
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
                return serialize.Serialize(VisitsDao.findAll());
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
