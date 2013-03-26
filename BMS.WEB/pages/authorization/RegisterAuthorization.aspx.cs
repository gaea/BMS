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
    public partial class RegisterAuthorization : System.Web.UI.Page
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
						case "GetEntryType":
                            Response.Write("({success: true, data:" + this.GetEntryType() + "})");
                            break;
						case "GetState":
                            Response.Write("({success: true, data:" + this.GetState() + "})");
                            break;
						case "GetPerson":
                            Response.Write("({success: true, data:" + this.GetPerson() + "})");
                            break;
						case "GetAprobatorPerson":
                            Response.Write("({success: true, data:" + this.GetAprobatorPerson() + "})");
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
                Dictionary<string, string> dicProperties = JsonConvert.DeserializeObject<Dictionary<string, string>>(objProperties);

                Visit visit = new Visit();
                visit.Id_Visitor = (float)Convert.ToInt64(dicProperties["Id_Person"]);

                DateTime InitialDate = Convert.ToDateTime(dicProperties["InitialDate"] + " " + dicProperties["InitialHour"]);
                DateTime FinalDate = Convert.ToDateTime(dicProperties["FinalDate"] + " " + dicProperties["FinalHour"]);

                visit.InitialDate = InitialDate;
                visit.InitialHour = InitialDate;
                visit.FinalDate = FinalDate;
                visit.FinalHour = FinalDate;
                visit.Id_Functionary = (float)Convert.ToInt64(dicProperties["Id_Functionary"]);
                visit.ElementsToGetIn = dicProperties["ElementsToGetIn"];
                visit.VisitDescription = dicProperties["VisitDescription"];
                visit.DateCreateTransaction = System.DateTime.Now;
                visit.DateModifyRegistration = System.DateTime.Now;
                visit.DateCreateRegistration = System.DateTime.Now;
                VisitsDao.save(visit);

                msg.Message = ConfigManager.SaveSuccessMessage;
            }
            catch (Exception exception)
            {
                msg.Message = ConfigManager.SaveErrorMessage;
                msg.Error = exception.ToString();
            }

            return serialize.Serialize(msg);
        }

        public string GetEntryType() {
            
            System.Threading.Thread.Sleep(int.Parse(ConfigManager.TimeForResponseRequest));

            return serialize.Serialize(EntryTypesDao.findAll());
        }

        public string GetState()
        {
            System.Threading.Thread.Sleep(int.Parse(ConfigManager.TimeForResponseRequest));

            return serialize.Serialize(StatesDao.findAll());
        }

        public string GetPerson()
        {
            System.Threading.Thread.Sleep(int.Parse(ConfigManager.TimeForResponseRequest));

            return serialize.Serialize(PersonsDao.findAll());
        }

        public string GetAprobatorPerson()
        {
            System.Threading.Thread.Sleep(int.Parse(ConfigManager.TimeForResponseRequest));

            return serialize.Serialize(PersonsDao.findAll());
        }

    }
}
