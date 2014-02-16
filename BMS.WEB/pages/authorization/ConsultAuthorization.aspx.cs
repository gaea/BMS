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
                    int start = Convert.ToInt32(Request.Params["start"]);
                    int limit = Convert.ToInt32(Request.Params["limit"]);
                    string field = Request.Params["field"];
                    string value = Request.Params["value"];
                    string callback = Request.Params["callback"];

                    switch (action)
                    {
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

        public string Find(int start, int limit, string field, string value)
        {
            MessageResponse msg = new MessageResponse();
            DataResponse<TMA.MODEL.Entity.Visit> dataResponse = new DataResponse<TMA.MODEL.Entity.Visit>();

            try
            {
                int numberParam;

                if (int.TryParse(value, out numberParam))
                {
                    dataResponse.Result = VisitsDao.findBy(start, limit, field, numberParam);
                    dataResponse.Total = VisitsDao.Count(field, numberParam);
                }
                else 
                {
                    if (field.Contains("Person"))
                    {
                        if (field.Contains("Company"))
                        {
                            dataResponse.Result = VisitsDao.findCompanyBy(start, limit, field.Split('.')[2], value);
                            dataResponse.Total = VisitsDao.CountCompanyBy(field.Split('.')[2], value);
                        }
                        else
                        {
                            dataResponse.Result = VisitsDao.findPersonBy(start, limit, field.Split('.')[1], value);
                            dataResponse.Total = VisitsDao.CountPersonBy(field.Split('.')[1], value);
                        }
                    }
                    else
                    {
                        if (field.Contains("Functionary"))
                        {
                            if (field.Contains("Name"))
                            {
                                dataResponse.Result = VisitsDao.findFunctionaryBy(start, limit, field.Split('.')[2], value);
                                dataResponse.Total = VisitsDao.CountFunctionaryBy(field.Split('.')[2], value);
                            }
                        }
                        else
                        {
                            DateTime InitialDate;
                            if (DateTime.TryParse(value, out InitialDate))
                            {
                                dataResponse.Result = VisitsDao.findBy(start, limit, field, InitialDate);
                                dataResponse.Total = VisitsDao.Count(field, InitialDate);
                            }
                            else
                            {
                                dataResponse.Result = VisitsDao.findBy(start, limit, field, value);
                                dataResponse.Total = VisitsDao.Count(field, value);
                            }
                        }
                    }
                }

                return dataResponse.ToJsonString();
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

            DataResponse<TMA.MODEL.Entity.Visit> dataResponse = new DataResponse<TMA.MODEL.Entity.Visit>();

            try
            {
                DateTime today = System.DateTime.Today;

                dataResponse.Result = VisitsDao.findByInitialDate(start, limit, today);
                dataResponse.Total = VisitsDao.CountByInitialDate(today);

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
