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

namespace BMS.WEB.pages.audit
{
    public partial class ConsultAuditEntry : System.Web.UI.Page
    {
        public JavaScriptSerializer serialize = new JavaScriptSerializer();

		protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string action = Request.Params["accion"];
                if (!string.IsNullOrEmpty(action))
                {
                    int start = Convert.ToInt32(Request.Params["start"]);
                    int limit = Convert.ToInt32(Request.Params["limit"]);
                    string callback = Request.Params["callback"];

                    switch (action)
                    {
                        case "List":
                            Response.Write(string.Concat(callback, this.List(start, limit)));
                            break;
                        default:
                            return;
                    }

                    Response.End();
                }
            }
        }
		
        public string List(int start, int limit)
        {
            MessageResponse msg = new MessageResponse();

            DataResponse<TMA.MODEL.Entity.AuditEntry> dataResponse = new DataResponse<TMA.MODEL.Entity.AuditEntry>();

            try
            {
                dataResponse.Result = AuditEntryDao.findAll(start, limit);
                dataResponse.Total = AuditEntryDao.Count();

                return dataResponse.ToJsonString();
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
