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
    public partial class Headquarter : System.Web.UI.Page
    {
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
                        case "Save":
                            Response.Write("({success: true, data:" + this.Save(Request.Params["objProperties"]) + "})");
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


        public string Save(string HeadquarterProperties)
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                TMA.MODEL.Entity.Headquarter headquarter = serialize.Deserialize<TMA.MODEL.Entity.Headquarter>(HeadquarterProperties);

                if (headquarter.Id_Headquarter == null)
                {
                    HeadquartersDao.save(headquarter);
                }
                else
                {
                    HeadquartersDao.update(headquarter);
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
                return serialize.Serialize(HeadquartersDao.findAll());
            }
            catch (Exception ex)
            {
                msg.Message = ConfigManager.DeleteErrorMessage;

                msg.Error = ex.ToString();

                File.AppendAllText(ConfigManager.LogPath, msg.ToString());
            }

            return serialize.Serialize(msg);
        }

        public string Delete(string Id_Headquarter)
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                TMA.MODEL.Entity.Headquarter headquarter = HeadquartersDao.find(Convert.ToInt32(Id_Headquarter));
            
                HeadquartersDao.delete(headquarter);

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
