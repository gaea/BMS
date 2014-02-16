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

namespace BMS.WEB.pages
{
    public partial class Charge : System.Web.UI.Page
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
                        case "Save":
                            Response.Write("({success: true, data:" + this.Save(Request.Params["objProperties"]) + "})");
                            break;
                        case "List":
                            Response.Write("({success: true, data:" + this.List("","") + "})");
                            break;
                        case "Delete":
                            Response.Write("({success: true, data:" + this.Delete(Request.Params["objProperties"]) + "})");
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
                TMA.MODEL.Entity.Charge charge = serialize.Deserialize<TMA.MODEL.Entity.Charge>(objProperties);

                if (charge.Id_Charge == null)
                {
                    ChargesDao.save(charge);
                }
                else
                {
                    ChargesDao.update(charge);
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
                return serialize.Serialize(ChargesDao.findAll());
            }
            catch (Exception ex)
            {
                msg.Message = ConfigManager.DeleteErrorMessage;

                msg.Error = ex.ToString();

                File.AppendAllText(ConfigManager.LogPath, msg.ToString());
            }

            return serialize.Serialize(msg);
        }

        public string Delete(string Id_Charge)
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                TMA.MODEL.Entity.Charge charge = ChargesDao.find(Convert.ToInt32(Id_Charge));

                ChargesDao.delete(charge);

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
