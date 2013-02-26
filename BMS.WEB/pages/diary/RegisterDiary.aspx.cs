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
    public partial class RegisterDiary : System.Web.UI.Page
    {
        public static JavaScriptSerializer serialize = new JavaScriptSerializer();

        [System.Web.Services.WebMethod]
        public static string Save(string DiaryProperties)
        {
            MessageResponse msg = new MessageResponse();

            try
            {

                Dictionary<string, string> dicProperties = JsonConvert.DeserializeObject<Dictionary<string, string>>(DiaryProperties);
                
                Diary diary = new Diary()
                {
                    Description = dicProperties["Description"],
                    DateDiary = Convert.ToDateTime(dicProperties["DateDiary"]).ToString(ConfigManager.FieldsTypeDateFormat),
                    HourDiary = Convert.ToDateTime(dicProperties["HourDiary"]).ToString(ConfigManager.FieldsTypeTimeFormat),
                    Id_User = 1
                };

                if (diary.Id_Diary == null)
                {
                    diary.DateCreateRegistration = System.DateTime.Now;

                    DiarysDao.save(diary);
                }
                else
                {
                    diary.DateModifyRegistration = System.DateTime.Now;

                    DiarysDao.update(diary);
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
        public static string GetEntryType()
        {
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
    }
}
