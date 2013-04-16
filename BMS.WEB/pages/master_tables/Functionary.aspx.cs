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
                //TMA.MODEL.Entity.Functionary functionary = FunctionariesDao.find()

                TMA.MODEL.Entity.Functionary objFunctionary = serialize.Deserialize<TMA.MODEL.Entity.Functionary>(objProperties);
                TMA.MODEL.Entity.Functionary functionary;

                if (objFunctionary.Id_Functionary == null)
                {
                    functionary = new TMA.MODEL.Entity.Functionary();
                    functionary.DateCreateRegistration = System.DateTime.Now;
                    FunctionariesDao.save(functionary);
                }
                else
                {
                    functionary = FunctionariesDao.find(objFunctionary.Id_Functionary);
                }

                functionary.DateModifyRegistration = System.DateTime.Now;
                functionary.Address = objFunctionary.Address; functionary.BeeperCode = objFunctionary.BeeperCode;
                functionary.BeeperNumber = objFunctionary.BeeperNumber;
                functionary.BirthdayDay = objFunctionary.BirthdayDay; 
                functionary.BirthdayMonth = objFunctionary.BirthdayMonth;
                functionary.BossExtensionNumber = objFunctionary.BossExtensionNumber;
                functionary.Email = objFunctionary.Email;
                functionary.ExtensionNumber = objFunctionary.ExtensionNumber;
                functionary.FaxNumber = objFunctionary.FaxNumber;
                functionary.LastName = objFunctionary.LastName;
                functionary.Name = objFunctionary.Name;
                functionary.Observations = objFunctionary.Observations;
                functionary.Password = objFunctionary.Password;
                functionary.AirSection = objFunctionary.AirSection;
                functionary.BossName = objFunctionary.BossName;
                functionary.ByHour = objFunctionary.ByHour;
                functionary.ByPayroll = objFunctionary.ByPayroll;
                functionary.CelphoneNumber = objFunctionary.CelphoneNumber;
                functionary.ContractClass = objFunctionary.ContractClass;
                functionary.Id_Charge = objFunctionary.Id_Charge;
                functionary.Id_City = objFunctionary.Id_City;
                functionary.Id_Company = objFunctionary.Id_Company;
                functionary.Id_CostCenter = objFunctionary.Id_CostCenter;
                functionary.Id_Dependency = objFunctionary.Id_Dependency;
                functionary.Photo = objFunctionary.Photo;
                functionary.PostalZone = objFunctionary.PostalZone;
                functionary.TelephoneNumber = objFunctionary.TelephoneNumber;
                //functionary.Turn = objFunctionary.Turn;
                
                functionary.FingerPrint = objFunctionary.FingerPrint;
                functionary.Id_Between = objFunctionary.Id_Between;
                functionary.Id_BiometricReader = objFunctionary.Id_BiometricReader;
                
                functionary.Id_Headquarter = objFunctionary.Id_Headquarter;
                functionary.IndexReader = objFunctionary.IndexReader;
                functionary.IntegralSalary = objFunctionary.IntegralSalary;
                functionary.IsActive = objFunctionary.IsActive;
                
                

                FunctionariesDao.update(functionary);

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
