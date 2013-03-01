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
        public static JavaScriptSerializer serialize = new JavaScriptSerializer();

        [System.Web.Services.WebMethod]
        public static string Save(string DiaryProperties)
        {
            MessageResponse msg = new MessageResponse();

            try
            {
                Diary diary = serialize.Deserialize<Diary>(DiaryProperties);
                
                diary.DateCreateRegistration = System.DateTime.Now;
                diary.DateModifyRegistration = System.DateTime.Now;
                //diary.Id_UserCreateRegistration = "1";
                //diary.Id_UserModifyRegistration = "1";

                if(diary.Id_Visitor == 0)
                {
                    TMA.MODEL.Entity.Person person = new TMA.MODEL.Entity.Person();
                    person.Name = "";
                }

                diary.State = "State";

                if (diary.Id_Diary == null)
                {
                    DiariesDao.save(diary);
                }
                else
                {
                    DiariesDao.update(diary);
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

        [System.Web.Services.WebMethod]
        public static string GetEntryType() {
            return serialize.Serialize(EntryTypesDao.findAll());
        }

        [System.Web.Services.WebMethod]
        public static string GetState()
        {
            return serialize.Serialize(StatesDao.findAll());
        }

        [System.Web.Services.WebMethod]
        public static string GetPerson()
        {
            return serialize.Serialize(PersonsDao.findAll());
        }

        [System.Web.Services.WebMethod]
        public static string GetAprobatorPerson()
        {
            return serialize.Serialize(PersonsDao.findAll());
        }

        [System.Web.Services.WebMethod]
        public static string SaveVisit(string VisitProperties)
        {
            MessageResponse msg = new MessageResponse();
            try
            {
                Dictionary<string, string> dicProperties = JsonConvert.DeserializeObject<Dictionary<string, string>>(VisitProperties);
                
                Visit visit = new Visit();
                visit.Id_Visitor = Convert.ToInt32(dicProperties["Id_Person"]);

                DateTime InitialDate = Convert.ToDateTime(dicProperties["InitialDate"] + " " + dicProperties["InitialHour"]);
                DateTime FinalDate = Convert.ToDateTime(dicProperties["FinalDate"] + " " + dicProperties["FinalHour"]);

                //visit.InitialDate = Convert.ToDateTime(dicProperties["InitialDate"]);
                //visit.InitialHour = Convert.ToDateTime(dicProperties["InitialHour"]);
                //visit.FinalDate = Convert.ToDateTime(dicProperties["FinalDate"]);
                //visit.FinalHour = Convert.ToDateTime(dicProperties["FinalHour"]);

                visit.InitialDate = InitialDate;
                visit.InitialHour = InitialDate;
                visit.FinalDate = FinalDate;
                visit.FinalHour = FinalDate;
                visit.DocumentNumberVisitor = Convert.ToInt32(dicProperties["Id_Person"]);
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
    }
}
