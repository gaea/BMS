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
using TMA.DAO.EntityManager;
using System.Web.Script.Serialization;
using BMS.WEB.cls;
using System.Collections.Generic;
using Newtonsoft.Json;
using BMS.CONFIGURATION;
using System.IO;
using BMS.UTILITY;

namespace BMS.WEB.pages.person
{
    public partial class RegisterPerson : System.Web.UI.Page
    {
        public Utility util = new Utility();

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
                            Response.Write("({success: true, data:" + this.Save(Request.Params["objProperties"]) + "})");
                            break;
                        case "Delete":
                            Response.Write("({success: true, data:" + this.Delete(Request.Params["objProperties"]) + "})");
                            break;
                        case "GetCompany":
                            Response.Write("({success: true, data:" + this.GetCompany() + "})");
                            break;
                        case "GetCity":
                            Response.Write("({success: true, data:" + this.GetCity() + "})");
                            break;
                        case "GetDepartment":
                            Response.Write("({success: true, data:" + this.GetDepartment() + "})");
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

        public string Save(string objProperties)
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                HttpContext context = HttpContext.Current;

                Dictionary<string, string> dicProperties = JsonConvert.DeserializeObject<Dictionary<string, string>>(objProperties);

                TMA.MODEL.Entity.Person person = PersonsDao.find(Convert.ToDecimal(util.getValueFromDictionary("Id_Person", dicProperties)));

                if (person == null)
                {
                    person = new TMA.MODEL.Entity.Person();
                    person.Id_Person = util.getValueFromDictionary("Id_Person", dicProperties) != "" ? Convert.ToInt64(util.getValueFromDictionary("Id_Person", dicProperties)) : 0;
                    person.DateCreateRegistration = System.DateTime.Now;

                    PersonsDao.save(person);
                }

                person.Name = util.getValueFromDictionary("Name", dicProperties);
                person.LastName = util.getValueFromDictionary("LastName", dicProperties);
                person.IsActive = Convert.ToInt32(util.getValueFromDictionary("IsActive", dicProperties));
                person.Address = util.getValueFromDictionary("Address", dicProperties);
                person.BirthdayDay = Convert.ToInt32(util.getValueFromDictionary("BirthdayDay", dicProperties));
                person.BirthdayMonth = Convert.ToInt32(util.getValueFromDictionary("BirthdayMonth", dicProperties));
                person.TelephoneNumber = Convert.ToInt32(util.getValueFromDictionary("TelephoneNumber", dicProperties));
                person.CelphoneNumber = Convert.ToInt64(util.getValueFromDictionary("CelphoneNumber", dicProperties));
                person.City = Convert.ToInt32(util.getValueFromDictionary("Id_City", dicProperties));
                person.Company = Convert.ToInt32(util.getValueFromDictionary("Id_Third", dicProperties));
                person.Email = util.getValueFromDictionary("Email", dicProperties);
                person.Observations = util.getValueFromDictionary("Observations", dicProperties);
                person.FaxNumber = Convert.ToInt32(util.getValueFromDictionary("FaxNumber", dicProperties));

                person.Contractor = Convert.ToInt32(util.getValueFromDictionary("Contractor", dicProperties));

                if (person.Contractor == 1)
                {
                    person.DateValidityARP = Convert.ToDateTime(util.getValueFromDictionary("DateValidityARP", dicProperties));
                }
                else
                {
                    person.DateValidityARP = null;
                }

                person.DateModifyRegistration = System.DateTime.Now;

                if (context.Request.Files[0].FileName != "")
                {
                    if (person.Photo != null && person.Photo != "")
                    {
                        if (File.Exists(Path.Combine(ConfigManager.ImagePath, person.Photo)))
                        {
                            File.Delete(Path.Combine(ConfigManager.ImagePath, person.Photo));
                        }
                    }

                    /*if (!Directory.Exists(Path.Combine(ConfigManager.ImagePath, person.Id_Person.ToString())))
                    {
                        Directory.CreateDirectory(Path.Combine(ConfigManager.ImagePath, person.Id_Person.ToString()));
                    }*/

                    //string extImage = Path.GetExtension(context.Request.Files[0].FileName);

                    context.Request.Files[0].SaveAs(Path.Combine(ConfigManager.ImagePath, util.getValueFromDictionary("Id_Person", dicProperties) /*+ extImage*/));
                    person.Photo = util.getValueFromDictionary("Id_Person", dicProperties) /*+ extImage*/;
                }

                PersonsDao.update(person);

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

            DataResponse<TMA.MODEL.Entity.Person> dataResponse = new DataResponse<TMA.MODEL.Entity.Person>();

            try
            {
                dataResponse.Result = PersonsDao.findAll(start, limit);
                dataResponse.Total = PersonsDao.Count();

                return dataResponse.ToJsonString();
            }
            catch (Exception ex)
            {
                msg.Message = ConfigManager.ListErrorMessage;
                msg.Error = ex.ToString();
            }

            return serialize.Serialize(msg);
        }

        public string Delete(string Id_Person)
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                TMA.MODEL.Entity.Person person = PersonsDao.find(Convert.ToInt32(Id_Person));

                PersonsDao.delete(person);

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

        public string GetCompany()
        {
            return serialize.Serialize(CompaniesDao.findAll());
        }

        public string GetCity()
        {
            return serialize.Serialize(CitiesDao.findAll());
        }

        public string GetDepartment()
        {
            return serialize.Serialize(DepartmentsDao.findAll());
        }
    }
}
