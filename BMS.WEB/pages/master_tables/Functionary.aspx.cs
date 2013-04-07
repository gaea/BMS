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
using Newtonsoft.Json;

namespace BMS.WEB.pages
{
    public partial class Functionary : System.Web.UI.Page
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
                            int start = Convert.ToInt32(Request.Params["start"]);
                            int limit = Convert.ToInt32(Request.Params["limit"]);
                            Response.Write(Request.Params["callback"] + "({\"total\":" + this.Count() + ",\"result\":" + this.List(start, limit) + "})");
                            break;
                        case "Delete":
                            Response.Write("({success: true, data:" + this.Delete(Request.Params["objProperties"]) + "})");
                            break;
                        case "GetCompany":
                            Response.Write("({success: true, data:" + this.GetCompany() + "})");
                            break;
                        default:
                            return;
                    }

                    Response.End();
                }
            }
        }

        public string GetCompany()
        {
            return serialize.Serialize(CompaniesDao.findAll());
        }

        public string Save(string objProperties)
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                TMA.MODEL.Entity.Functionary functionary = serialize.Deserialize<TMA.MODEL.Entity.Functionary>(objProperties);

                if (functionary.Id_Functionary == null)
                {
                    functionary.Id_UserCreateRegistration = "1";

                    functionary.Id_UserModifyRegistration = "1";

                    functionary.DateCreateRegistration = System.DateTime.Now;

                    FunctionariesDao.save(functionary);
                }
                else
                {
                    functionary.DateModifyRegistration = System.DateTime.Now;

                    FunctionariesDao.update(functionary);
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

        public int Count()
        {
            int count = FunctionariesDao.Count();

            return count;
        }

        public string List(int start, int limit)
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                if (limit != 0)
                {
                    return JsonConvert.SerializeObject(FunctionariesDao.findAll(start, limit));
                }
                else 
                {
                    return JsonConvert.SerializeObject(FunctionariesDao.findAll());
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

        public string Delete(string Id_Functionary)
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                TMA.MODEL.Entity.Functionary functionary = FunctionariesDao.find(Convert.ToInt32(Id_Functionary));

                FunctionariesDao.delete(functionary);

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
