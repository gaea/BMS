﻿using System;
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

namespace BMS.WEB.pages.authorization
{
    public partial class RegisterRequest : System.Web.UI.Page
    {
        public JavaScriptSerializer serialize = new JavaScriptSerializer();

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

                    switch (accion)
                    {
                        case "List":
                            Response.Write(string.Concat(callback, this.List(start, limit)));
                            break;
                        case "Save":
                            Response.Write("({success: true, data:" + this.Acept(Request.Params["objProperties"]) + "})");
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

        public string List(int start, int limit)
        {
            MessageResponse msg = new MessageResponse();

            DataResponse<TMA.MODEL.Entity.Authorization> dataResponse = new DataResponse<TMA.MODEL.Entity.Authorization>();

            try
            {
                dataResponse.Result = AuthorizationsDao.findAll(start, limit);
                dataResponse.Total = AuthorizationsDao.Count();

                return dataResponse.ToJsonString();
            }
            catch (Exception ex)
            {
                msg.Message = ConfigManager.ListErrorMessage;
                msg.Error = ex.ToString();
            }

            return serialize.Serialize(msg);
        }

        public string Acept(string Id_Authorization)
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                TMA.MODEL.Entity.Authorization authorization = AuthorizationsDao.find(Convert.ToInt32(Id_Authorization));

                authorization.Authorized = true;
                AuthorizationsDao.save(authorization);

                msg.Message = ConfigManager.SaveErrorMessage;
            }
            catch (Exception ex)
            {
                msg.Message = ConfigManager.SaveErrorMessage;
                msg.Error = ex.ToString();
            }

            return serialize.Serialize(msg);
        }

    }
}
