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

namespace BMS.WEB.pages.diary
{
    public partial class ConsultDiary : System.Web.UI.Page
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
                    string field = Request.Params["field"];
                    string value = Request.Params["value"];
                    string callback = Request.Params["callback"];

                    switch (action)
                    {
                        case "Delete":
                            Response.Write("({success: true, data:" + this.Delete(Convert.ToInt32(Request.Params["objProperties"])) + "})");
                            break;
                        case "List":
                            Response.Write(string.Concat(callback, this.List(start, limit)));
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

        public string Delete(int Id_Diary)
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                Diary diary = DiariesDao.find(Id_Diary);

                DiariesDao.delete(diary);

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

        public string Find(int start, int limit, string field, string value)
        {
            MessageResponse msg = new MessageResponse();
            DataResponse<TMA.MODEL.Entity.Diary> dataResponse = new DataResponse<TMA.MODEL.Entity.Diary>();

            try
            {
                float numberParam;

                if (float.TryParse(value, out numberParam))
                {
                    dataResponse.Result = DiariesDao.findBy(start, limit, field, numberParam.ToString());
                    dataResponse.Total = DiariesDao.Count(field, numberParam.ToString());

                    return dataResponse.ToJsonString();
                }
                else
                {
                    if (field.Contains("Person"))
                    {
                        if (field.Contains("Company"))
                        {
                            dataResponse.Result = DiariesDao.findCompanyBy(start, limit, field.Split('.')[2], value);
                            dataResponse.Total = DiariesDao.CountCompany(field.Split('.')[2], value);

                            return dataResponse.ToJsonString();
                        }
                        else
                        {
                            dataResponse.Result = DiariesDao.findPersonBy(start, limit, field.Split('.')[1], value);
                            dataResponse.Total = DiariesDao.CountPerson(field.Split('.')[1], value);

                            return dataResponse.ToJsonString();
                        }
                    }
                    if (field.Contains("Functionary"))
                    {
                        if (field.Contains("Name"))
                        {
                            dataResponse.Result = DiariesDao.findFunctionaryBy(start, limit, field.Split('.')[2], value);
                            dataResponse.Total = DiariesDao.CountFunctionary(field.Split('.')[1], value);

                            return dataResponse.ToJsonString();
                        }
                    }
                    else
                    {
                        dataResponse.Result = DiariesDao.findBy(start, limit, field, value);
                        dataResponse.Total = DiariesDao.Count(field, value);

                        return dataResponse.ToJsonString();
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

        public string List(int start, int limit)
        {
            MessageResponse msg = new MessageResponse();

            DataResponse<TMA.MODEL.Entity.Diary> dataResponse = new DataResponse<TMA.MODEL.Entity.Diary>();

            try
            {
                DateTime today = System.DateTime.Today;

                dataResponse.Result = DiariesDao.findBy(start, limit, "DateDiary", today.ToString("yyyy-MM-dd"));
                dataResponse.Total = DiariesDao.Count("DateDiary", today.ToString("yyyy-MM-dd"));

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
